const Adoption = artifacts.require('./Adoption.sol');

contract('adoption', function(accounts) {
  const adopter = accounts[1];

  it('should adopt', async () => {
    const adoption = await Adoption.deployed();
    const petId = 6;

    await adoption.adopt(petId, { from: adopter });
    const returnedAdopter = await adoption.adopters(petId);

    assert.equal(returnedAdopter, adopter, 'Adopter should match account');
  });
});
