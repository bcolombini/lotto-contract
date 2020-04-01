// pragma solidity >=0.4.3 <0.7.0;

// import {Math} from "./Math.sol";
// import {SafeMath} from "./SafeMath.sol";

// contract Lotto {

//     struct AnimalGroup{
//         string name;
//         uint8[4] numbers;
//     }

//     struct Role{
//         string BetName;
//         uint8 payment;
//     }

//     AnimalGroup[] private animalGroups;
//     Role[] private roles;

//     using SafeMath for uint256;

//     constructor() public{
//         generateGroups();
//     }


//     function generateGroups() private {
//         animalGroups.push(AnimalGroup('avestruz',[1,2,3,4]));
//         animalGroups.push(AnimalGroup('aguia',[5,6,7,8]));
//         animalGroups.push(AnimalGroup('burro',[9,10,11,12]));
//         animalGroups.push(AnimalGroup('borboleta',[13,14,15,16]));
//         animalGroups.push(AnimalGroup('cachorro',[17,18,19,20]));
//         animalGroups.push(AnimalGroup('cabra',[21,22,23,24]));
//         animalGroups.push(AnimalGroup('carneiro',[25,26,27,28]));
//         animalGroups.push(AnimalGroup('camelo',[29,30,31,32]));
//         animalGroups.push(AnimalGroup('cobra',[33,34,35,36]));
//         animalGroups.push(AnimalGroup('coelho',[37,38,39,40]));
//         animalGroups.push(AnimalGroup('cavalo',[41,42,43,44]));
//         animalGroups.push(AnimalGroup('elefante',[45,46,47,48]));
//         animalGroups.push(AnimalGroup('galo',[49,50,51,52]));
//         animalGroups.push(AnimalGroup('gato',[53,54,55,56]));
//         animalGroups.push(AnimalGroup('jacare',[57,58,59,60]));
//         animalGroups.push(AnimalGroup('leao',[61,62,63,64]));
//         animalGroups.push(AnimalGroup('macaco',[65,66,67,68]));
//         animalGroups.push(AnimalGroup('porco',[69,70,71,72]));
//         animalGroups.push(AnimalGroup('pavao',[73,74,75,76]));
//         animalGroups.push(AnimalGroup('peru',[77,78,79,80]));
//         animalGroups.push(AnimalGroup('touro',[81,82,83,84]));
//         animalGroups.push(AnimalGroup('tigre',[85,86,87,88]));
//         animalGroups.push(AnimalGroup('urso',[89,90,91,92]));
//         animalGroups.push(AnimalGroup('veado',[93,94,95,96]));
//         animalGroups.push(AnimalGroup('vaca',[97,98,99,0]));
//     }

//     function generateRoles(){
//     }
    
//     function selfDestroy() onlyOwner{
//         selfDestroy()
        
//     }

// }  