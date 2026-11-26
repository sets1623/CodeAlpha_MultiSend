
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MultiSend {

    bool private locked;

    event PaymentSent(
        address indexed recipient,
        uint256 amount
    );

    modifier nonReentrant() {
        require(!locked, "Transaction already in progress");
        locked = true;
        _;
        locked = false;
    }

    function sendEther(
        address[] calldata recipients
    )
        external
        payable
        nonReentrant
    {
        // Check recipient list
        require(recipients.length > 0, "No recipients");

        // Check Ether amount
        require(msg.value > 0, "Send some Ether");

        // Ensure equal distribution without leftover wei
        require(
            msg.value % recipients.length == 0,
            "Amount must divide equally"
        );

        uint256 share = msg.value / recipients.length;

        // Validate all addresses and prevent duplicates
        for (uint256 i = 0; i < recipients.length; i++) {
            require(
                recipients[i] != address(0),
                "Invalid recipient"
            );

            require(
                recipients[i] != address(this),
                "Cannot pay contract itself"
            );

            for (uint256 j = 0; j < i; j++) {
                require(
                    recipients[i] != recipients[j],
                    "Duplicate recipient"
                );
            }
        }

        // Send equal Ether shares
        for (uint256 i = 0; i < recipients.length; i++) {
            (bool success, ) = payable(recipients[i]).call{
                value: share
            }("");

            require(success, "Ether transfer failed");

            emit PaymentSent(recipients[i], share);
        }
    }
}
