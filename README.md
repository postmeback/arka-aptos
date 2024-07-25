# Escrow Smart Contract

## Overview

This Move module implements an escrow contract for automotive sales. The contract allows a buyer to deposit funds into an escrow account and releases them to the seller upon completion of the transaction. If the transaction is not completed, the funds can be returned to the buyer.

## Module: `escrow_program::escrowContract`

### Structs

- **Escrow**: Represents the escrow agreement.
  - `seller: address`
  - `buyer: address`
  - `amount: u64`
  - `is_completed: bool`

### Functions

- **create_escrow<CoinType>**
  - Parameters:
    - `account: &signer`: The account initiating the escrow.
    - `seller: address`: The seller's address.
    - `buyer: address`: The buyer's address.
    - `amount: u64`: The amount of coins to be held in escrow.
  - Description: Creates a new escrow agreement and transfers the specified amount from the sender to the escrow.

- **release_funds<CoinType>**
  - Parameters:
    - `account: &signer`: The account releasing the funds.
  - Description: Releases the funds from escrow to the seller and marks the escrow as completed.

- **cancel_escrow<CoinType>**
  - Parameters:
    - `account: &signer`: The account canceling the escrow.
  - Description: Cancels the escrow agreement, returns the funds to the buyer, and marks the escrow as completed.

### Tests

The module includes the following tests to ensure the correct functionality of the escrow contract:

- **test_create_escrow**: Tests the creation of a new escrow agreement.
- **test_release_funds**: Tests the release of funds from the escrow to the seller.
- **test_cancel_escrow**: Tests the cancellation of the escrow agreement and return of funds to the buyer.

## Usage

1. **Create an Escrow**: Call `create_escrow` with the appropriate parameters to create a new escrow agreement and transfer the funds to the escrow.

2. **Release Funds**: Call `release_funds` to release the funds from escrow to the seller upon completion of the transaction.

3. **Cancel Escrow**: Call `cancel_escrow` to cancel the escrow agreement and return the funds to the buyer if the transaction is not completed.

## Transaction Details

{
  "Result": {
    "transaction_hash": "0x8c9fe2685ff782a2ffefc896a55ec1314a46c91a1dc09a4f6de9306be3f8ca0e",
    "gas_used": 1521,
    "gas_unit_price": 100,
    "sender": "1551fe75e29741ded6855a284649d9fc91838135388507c7962b6101ec7ed107",
    "sequence_number": 0,
    "success": true,
    "timestamp_us": 1721660721579997,
    "version": 5512100155,
    "vm_status": "Executed successfully"
  }
}

## License

This project is licensed under the MIT License.
