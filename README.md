# time_locked_fund_smart_contract
A very basic solidity smart contract that shows how time locked funds work

This is a very simple Solidity contract that implements a time-lock fund.<br/>
Users can lock their funds in the contract for a specified duration, and then release the funds after the duration has elapsed.<br/>
The owner of the contract can also withdraw any funds that are not locked.

To use the contract, a user would first call the lockFunds() function to lock their funds in the contract. The user would then need to wait for the lockDuration period to elapse before they could call the releaseFunds() function to release their funds.