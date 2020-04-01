App = {
  web3Provider: null,
  contracts: {},
  gameSelected:[],
  gamePrice:0.002,
  contractInstance: null,

  init: async function() {
    // Load pets.
    var cartela = $('.cartela');
    var numberTemplate = $('#numberTemplate');
    cartela
    for(i = 1;i <= 60; i++){
      numberTemplate.find(".ball").attr("id",i);
      if(i < 10){
        numberTemplate.find(".ball").text("0"+i);
      } else {
        numberTemplate.find(".ball").text(i);
      }
      cartela.append(numberTemplate.html())
    }
    return App.initWeb3();
  },

  initWeb3: async function() {
    // Is there an injected web3 instance?
      if(window.ethereum){
        App.web3Provider = window.ethereum
        try {
          await window.ethereum.enable()
        } catch (error) {
          console.log(error.message)
          
        }
      }

    if (typeof web3 !== 'undefined') {
      App.web3Provider = web3.currentProvider;
    } else {
      // If no injected web3 instance is detected, fall back to Ganache
      App.web3Provider = new Web3.providers.HttpProvider('http://localhost:7545');
    }
    web3 = new Web3(App.web3Provider);
    
    return App.initContract();
  },

  initContract: function() {
    $.getJSON('MegaFodase.json', function(data) {
      // Get the necessary contract artifact file and instantiate it with Truffle
      var MegaFodaseArtifact = data;
      App.contracts.MegaFodase = TruffleContract(MegaFodaseArtifact);

      // Set the provider for our contract
      App.contracts.MegaFodase.setProvider(App.web3Provider);

      //Use our contract to retrieve and mark the adopted pets
      return App.updatePrize();
    });

    return App.bindEvents();
  },

  bindEvents: function() {
    $(document).on('click', '.ball', App.handleSelect);
    $(document).on('click', '.doBet', App.handleBet);
  },

  markAdopted: function(adopters, account) {
    var adoptionInstance;
    
    App.contracts.MegaFodase.deployed().then(function(instance) {
      adoptionInstance = instance;

      return adoptionInstance.getAdopters.call();
    }).then(function(adopters) {
      web3.eth.getAccounts(function(error, accounts) {
        if (error) {
          console.log(error);
        }
        account = accounts[0];

        for (i = 0; i < adopters.length; i++) {
          if (adopters[i] !== '0x0000000000000000000000000000000000000000') {
            $('.panel-pet').eq(i).find('.btn-adopt').text('Success').attr('disabled', true);
          }
        }
      });
    }).catch(function(err) {
      console.log(err.message);
    });

  },

  handleSelect: function(event){
    event.preventDefault();
    if(!$(event.target).hasClass("selected") && App.gameSelected.length < 30){
      $(event.target).addClass("selected")
      App.gameSelected.push($(event.target).attr("id"))
    } else{
      $(event.target).removeClass("selected")
      App.gameSelected = jQuery.grep(App.gameSelected, function(value) {
        return value != $(event.target).attr("id");
      });
    }
    if(App.gameSelected.length >= 6){
      $('.doBet').attr("disabled", false);	
      $(".gameTimes").text(Math.trunc(combinationGame(App.gameSelected)))
      $(".probabilityWin").text(probabilityGame(App.gameSelected) + " %")
      $(".price").text(combinationGame(App.gameSelected)*App.gamePrice)
    } else{
      $('.doBet').attr("disabled", true);	
      $(".price").text("0.000")
      $(".gameTimes").text(0)
      $(".probabilityWin").text("0 %")
    }
  },

  handleBet: function(event) {
    event.preventDefault();
    web3.eth.getAccounts(function(error, accounts) {
      if (error) {
        console.log(error);
      }

      var account = accounts[0];
      App.contractInstance.buyTicket(App.gameSelected,{value:combinationGame(App.gameSelected)*2000000000000000}).then(App.updatePrize)
      .catch(function(err) {
        console.log(err)
        console.log(err.message);
      });
    });
  },

  updatePrize:async function(){
    if(App.contractInstance == undefined){
      App.contractInstance = await App.contracts.MegaFodase.deployed()
    }
      var sortNumber = await App.contractInstance.sortNumbers()
      console.log(sortNumber)
      var sidePot = await App.contractInstance.getSidePot()
      var mainPot = await App.contractInstance.getMainPot()
      $(".mainPot").text("JackPot: ETH "+mainPot/1000000000000000000)
      // $(".sidePot").text("SidePot: ETH "+sidePot/1000000000000000000)
      $(".sidePot").text(sortNumber)


      web3.eth.getBalance(App.contractInstance.address,function(err,res){
          $(".lead").text(res/1000000000000000000)
      setTimeout(App.updatePrize,10000)
    })
  }

};

$(function() {
  $(window).load(function() {
    App.init();
  });
});