pragma solidity >=0.4.21 <0.7.0;

import {SafeMath} from "./SafeMath.sol";

library Math {
    using SafeMath for uint;
    function factorial(uint number) internal pure returns(uint){
        uint x = 1;
        uint res = 1;
        while (x <= number){
            res = res.mul(x);
            x = x.add(1);
        }
        return res;
    }
    function combinationGame(uint[] memory gameArray) internal pure returns(uint){
        uint n = gameArray.length;
        uint nFact = factorial(n);
        uint k = 6;
        uint kFact = factorial(k);
        uint removePossibility = factorial(n.sub(k));
        require(k <= n,"N should be high than k");
        return nFact.div(kFact.mul(removePossibility));
    }

}