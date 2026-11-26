# CodeAlpha_MultiSend

## MultiSend Smart Contract

This project is developed as part of the **CodeAlpha Blockchain Development Internship**.

MultiSend is a Solidity-based smart contract that allows users to send Ether to multiple wallet addresses in a single transaction. The contract distributes the Ether equally among all recipients.

## Features

- Send Ether to multiple recipients in one transaction.
- Distribute Ether equally among recipients.
- Accept Ether through a payable function.
- Validate recipient addresses.
- Prevent duplicate recipient addresses.
- Check whether each Ether transfer is successful.
- Emit a `PaymentSent` event for every successful payment.
- Include reentrancy protection.

## Technologies Used

- Solidity
- Remix IDE
- Ethereum Virtual Machine (EVM)
- Remix VM for testing

## Smart Contract Details

**Contract Name:** MultiSend

**Solidity Version:** ^0.8.20

**Main Function:** `sendEther(address[] calldata recipients)`

The function accepts an array of recipient addresses and Ether sent with the transaction. It calculates an equal share for each recipient and transfers the Ether.

## Testing

The smart contract was compiled, deployed, and tested using Remix IDE with Remix VM.

### Test 1: Single Recipient

- Sent 1 ETH to one recipient.
- Transaction completed successfully.
- `PaymentSent` event was generated.

### Test 2: Multiple Recipients

- Sent 3 ETH to three different recipients.
- Each recipient received 1 ETH.
- Transaction completed successfully.
- Three `PaymentSent` events were generated.

### Test 3: Equal Distribution Validation

- Attempted to send 1 ETH to three recipients.
- Transaction reverted with the message: `Amount must divide equally`.
- This confirmed that the equal distribution validation works correctly.

## Deployment

The contract was deployed and tested on the Remix VM environment. All testing was performed using simulated test Ether, not real funds.

## Conclusion

The MultiSend smart contract demonstrates how Ether can be distributed securely and equally among multiple recipients using Solidity. It also implements input validation, transfer verification, and reentrancy protection.

**Project developed for the CodeAlpha Blockchain Development Internship.**
