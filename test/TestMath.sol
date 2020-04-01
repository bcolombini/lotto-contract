pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Math.sol";

contract TestMath {

    function testFactorial() public {
        uint expected = 24;
        assert(Math.factorial(4) == expected);

    }

}

    // // Testing pet adoption
    // function testUserCanAdoptPet() public {
    //     uint returnId = adoption.adopt(8);

    //     uint expected = 8;

    //     Assert.equal(returnId, expected, "Adoption of pet ID 8 should be recorded");
    // }

    // // Testing retrieval of a single pet's owner
    // function testGetAdopterAddressByPetId() public {
    //     //Expected owner is this contract
    //     address expected = address(this);

    //     address adopter = adoption.adopters(8);

    //     Assert.equal(adopter, expected, "Owner of pet ID 8 should be recorded");
    // }

    // // Testing retrieval of all pet owners
    // function testGetAdopeterAddressByPetIdInArray() public {
    //     // Expeted owner is this contract
    //     address expected = address(this);

    //     // Store adopters in memory rather than contract's storage
    //     address[16] memory adopters = adoption.getAdopters();

    //     Assert.equal(adopters[8], expected, "Owner of pet ID 8 should be recorded.");
    // }

    // function testPetSending() public {
    //     adoption.sendPet(8, address(20));

    //     address expected = address(20);
    //     address adopter = adoption.adopters(8);

    //     Assert.equal(adopter, expected, "New owner of sent pet should be recorded.");
    // }
}