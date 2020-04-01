// pragma solidity >=0.4.3 <0.7.0;
// pragma experimental ABIEncoderV2;

// import {SafeMath} from "./SafeMath.sol";

// library Engine{

//     using SafeMath for uint256;

//     enum RolesNameEnum {
//         MILHAR_SECA,
//         MILHAR_1_5,
//         TERNO_SECO,
//         PASSA_VAI,
//         PASSA_VEM,
//         PASSA_VAI_VEM,
//         DEZENA,
//         DUQUE_DEZENA,
//         TERNO_DE_DEZENA,
//         GRUPO,
//         DUQUE_GRUPO,
//         TERNO_GRUPO
//     }

//     enum GroupNameEnum{
//         AVESTRUZ,
//         AGUIA,
//         BURRO,
//         BORBOLETA,
//         CACHORRO,
//         CABRA,
//         CARNEIRO,
//         CAMELO,
//         COBRA,
//         COELHO,
//         CAVALO,
//         ELEFANTE,
//         GALO,
//         GATO,
//         JACARE,
//         LEAO,
//         MACACO,
//         PORCO,
//         PAVAO,
//         PERU,
//         TOURO,
//         TIGRE,
//         URSO,
//         VEADO,
//         VACA
//     }

//     struct AnimalGroup{
//         GroupNameEnum groupEnum;
//         uint8[4] numbers;
//     }

//      struct Role{
//         RolesNameEnum roleEnum;
//         uint payment;
//     }

//     Animalgroup[] animalGroups;

//     constructor (){
//         animalGroups = generateGroups();
//     }

//     function generateGroups() public pure returns(AnimalGroup[25] memory){
//         return [AnimalGroup(GroupNameEnum.AVESTRUZ,[1,2,3,4]),
//         AnimalGroup(GroupNameEnum.AGUIA,[5,6,7,8]),
//         AnimalGroup(GroupNameEnum.BURRO,[9,10,11,12]),
//         AnimalGroup(GroupNameEnum.BORBOLETA,[13,14,15,16]),
//         AnimalGroup(GroupNameEnum.CACHORRO,[17,18,19,20]),
//         AnimalGroup(GroupNameEnum.CABRA,[21,22,23,24]),
//         AnimalGroup(GroupNameEnum.CARNEIRO,[25,26,27,28]),
//         AnimalGroup(GroupNameEnum.CAMELO,[29,30,31,32]),
//         AnimalGroup(GroupNameEnum.COBRA,[33,34,35,36]),
//         AnimalGroup(GroupNameEnum.COELHO,[37,38,39,40]),
//         AnimalGroup(GroupNameEnum.CAVALO,[41,42,43,44]),
//         AnimalGroup(GroupNameEnum.ELEFANTE,[45,46,47,48]),
//         AnimalGroup(GroupNameEnum.GALO,[49,50,51,52]),
//         AnimalGroup(GroupNameEnum.GATO,[53,54,55,56]),
//         AnimalGroup(GroupNameEnum.JACARE,[57,58,59,60]),
//         AnimalGroup(GroupNameEnum.LEAO,[61,62,63,64]),
//         AnimalGroup(GroupNameEnum.MACACO,[65,66,67,68]),
//         AnimalGroup(GroupNameEnum.PORCO,[69,70,71,72]),
//         AnimalGroup(GroupNameEnum.PAVAO,[73,74,75,76]),
//         AnimalGroup(GroupNameEnum.PERU,[77,78,79,80]),
//         AnimalGroup(GroupNameEnum.TOURO,[81,82,83,84]),
//         AnimalGroup(GroupNameEnum.TIGRE,[85,86,87,88]),
//         AnimalGroup(GroupNameEnum.URSO,[89,90,91,92]),
//         AnimalGroup(GroupNameEnum.VEADO,[93,94,95,96]),
//         AnimalGroup(GroupNameEnum.VACA,[97,98,99,0])];
//     }

//     function generateRoles() private pure returns(Role[] memory){
//     return [
//         Role(RolesNameEnum.MILHAR_SECA,4000),
//         Role(RolesNameEnum.MILHAR_1_5,800),
//         Role(RolesNameEnum.TERNO_SECO,3000),
//         Role(RolesNameEnum.PASSA_VAI,18),
//         Role(RolesNameEnum.PASSA_VEM,18),
//         Role(RolesNameEnum.PASSA_VAI_VEM,18),
//         Role(RolesNameEnum.DEZENA,18),
//         Role(RolesNameEnum.DUQUE_DEZENA,18),
//         Role(RolesNameEnum.TERNO_DE_DEZENA,18),
//         Role(RolesNameEnum.GRUPO,18),
//         Role(RolesNameEnum.DUQUE_GRUPO,18),
//         Role(RolesNameEnum.TERNO_GRUPO,18)
//         ];
//     }

//     function salteadoRule(uint groupChoice, uint numberSort) public pure returns(bool){
//         for (var index = 0; index < animalGroups.length; index++) {
//             animalGroups[index].conta
//         }
//     }


// }

