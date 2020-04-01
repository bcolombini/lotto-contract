pragma solidity >=0.4.3 <0.7.0;

import {Math} from "./Math.sol";
import {SafeMath} from "./SafeMath.sol";

contract Lotto {

    using SafeMath for uint256;

    struct Investor{
        address add;
        uint blockId;
        uint amountInvest;
    }

    event OnInvest(address indexed _from,uint _value);
    event OnDoGame(address indexed _from,uint _value,uint[] _game);
    event DoLog(string _eventName,uint _value);
    event DoLog(string _eventName,bytes32 _value);
    event DoLog(uint _value);

    event SortGame(string _eventName ,uint8[6] _numberSort, uint[] _playedGame, address _from, bool _isVictory);

    Investor[] private investors;

    uint betPrice = 2000000000000000;

    uint mainJackPot = 0;
    uint sideJackPot = 0;
    uint investorPot = 0;
    uint totalInvest = 0;
    uint private nonce = 0;

    string public constant name = "LottoToken";
    string public constant symbol = "LTT";
    uint8 public constant decimals = 18;


    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
    event Transfer(address indexed from, address indexed to, uint tokens);


    mapping(address => uint256) balances;

    mapping(address => mapping (address => uint256)) allowed;

    uint256 totalSupply_ = 1000000000000000000000000;

     function totalSupply() public view returns (uint256) {
	return totalSupply_;
    }

    function balanceOf(address tokenOwner) public view returns (uint) {
        return balances[tokenOwner];
    }

    function transfer(address receiver, uint numTokens) public returns (bool) {
        require(numTokens <= balances[msg.sender],"");
        balances[msg.sender] = balances[msg.sender].sub(numTokens);
        balances[receiver] = balances[receiver].add(numTokens);
        emit Transfer(msg.sender, receiver, numTokens);
        return true;
    }

    function approve(address delegate, uint numTokens) public returns (bool) {
        allowed[msg.sender][delegate] = numTokens;
        emit Approval(msg.sender, delegate, numTokens);
        return true;
    }

    function allowance(address owner, address delegate) public view returns (uint) {
        return allowed[owner][delegate];
    }

    function transferFrom(address owner, address buyer, uint numTokens) public returns (bool) {
        require(numTokens <= balances[owner],"");
        require(numTokens <= allowed[owner][msg.sender],"");

        balances[owner] = balances[owner].sub(numTokens);
        allowed[owner][msg.sender] = allowed[owner][msg.sender].sub(numTokens);
        balances[buyer] = balances[buyer].add(numTokens);
        emit Transfer(owner, buyer, numTokens);
        return true;
    }

    function invest()public payable {
        Investor memory investor = Investor(msg.sender,block.number,msg.value);
        investors.push(investor);

        mainJackPot = mainJackPot.add(msg.value.mul(SafeMath.div(7,10)));
        sideJackPot = sideJackPot.add(msg.value.mul(SafeMath.div(28,100)));
        
        totalInvest = totalInvest.add(msg.value);
    }

    function buyTicket(uint[] memory game) public payable{
        // require(definePrice(Math.combinationGame(game)) == msg.value,"The bet should be equal a (games * inital bet)");

        // mainJackPot = mainJackPot.add(msg.value.mul(SafeMath.div(7,10)));
        // sideJackPot = sideJackPot.add(msg.value.mul(SafeMath.div(28,100)));
        
        // emit DoLog("Amount",msg.value);
    	// emit DoLog("Calculate",msg.value.mul(7));
        emit SortGame("Sort Game",random(game),game,msg.sender,false);
        
        // investorPot = investorPot.add(msg.value.mul(SafeMath.div(2,100)));

        

        // address payable mainJackPotWallet = address(0x33eD7dAc1F6F902Ea85f003fCB7b32B592C8cA03);
        // address payable sideJackPotWallet = address(0xb8CBE8a50cDC8E9BCf1F7a2Ba39EDb662d6750B7);
        // address payable developersJackPotWallet = address(0x45bBD13B4BB7d2EE2a81E33F2BC48b121c6e9dFe);

        // developersJackPotWallet.transfer(msg.value * 2 / 100);
        
        // mainJackPotWallet.transfer(msg.value * 7/10);
        // sideJackPotWallet.transfer(msg.value * 28 / 100);
        // developersJackPotWallet.transfer(msg.value * 2 / 100);

    }

    // function withdrawInvest()private payable{

    // }
    function random(uint[] memory game) public payable returns (uint8[6] memory) {
        uint8[6] memory randomNumbers;
        uint position = 0;
        uint8 sortNumber;
        bool hasSimilarNumber = false;

        sortNumber = uint8(uint256(keccak256(abi.encodePacked(game[position],msg.sender,block.difficulty,nonce))).mod(60)+1);
        randomNumbers[0] = sortNumber;
        nonce++;

        while(randomNumbers[5] == 0){
            sortNumber = uint8(uint256(keccak256(abi.encodePacked(game[position],msg.sender,block.difficulty,nonce))).mod(60)+1);
            for(uint i = 0 ; i < randomNumbers.length ; i++){
                if(sortNumber == randomNumbers[i]){
                    hasSimilarNumber = false;
                    break;
                }
                hasSimilarNumber = true;
            }
            if(hasSimilarNumber){
                randomNumbers[position++] = sortNumber;
            }
            nonce++;
        }


        return randomNumbers;
    }

    function getSidePot() public view returns(uint){
        return sideJackPot;
    }

    function getMainPot() public view returns(uint){
        return mainJackPot;
    }

    function definePrice(uint games) private view returns(uint){
        return games.mul(betPrice);
    }

}