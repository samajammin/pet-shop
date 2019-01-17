pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {
    // The address of the adoption contract to be tested
    Adoption adoption = Adoption(DeployedAddresses.Adoption());

    // The id of the pet that will be used for testing
    uint expectedPetId = 8;

    // The expected owner of adopted pet is this contract
    address expectedAdopter = address(this);

    function testAdopt() public {
        uint returnedId = adoption.adopt(expectedPetId);

        Assert.equal(returnedId, expectedPetId, "Adoption of the expected pet should match what is returned.");
    }

    function testGetAdopterAddressByPetId() public {
        address adopter = adoption.adopters(expectedPetId);

        Assert.equal(adopter, expectedAdopter, "Owner of the expected pet should be this contract");
    }

    function testGetAdopters() public {
        // Store adopters in memory rather than contract's storage
        address[16] memory adopters = adoption.getAdopters();

        Assert.equal(adopters.length, 16, "getAdopters should return an array of 16 addresses");
        Assert.equal(adopters[expectedPetId], expectedAdopter, "Owner of the expected pet should be this contract");
    }
    // TODO test exceptions
    // https://truffleframework.com/tutorials/testing-for-throws-in-solidity-tests
    // function testAdoptOutOfRange() public {
    //   uint returnedErr = adoption.adopt(20);

    //   Assert.isFalse(returnedErr, "Adoption out of range should fail.");
    // }

    // TODO test event


}
