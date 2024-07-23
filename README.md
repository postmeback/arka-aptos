# Escrow Smart Contract

This repository contains a simple escrow smart contract written in Move for the Aptos blockchain. The contract facilitates secure transactions between a buyer and a seller by holding funds in escrow until the transaction is completed or canceled.

## Contract Overview

The contract includes the following main functions:

1. **create_escrow**: Initializes a new escrow with the specified seller, buyer, and amount.
2. **release_funds**: Releases the funds from the escrow to the seller upon successful completion of the transaction.
3. **cancel_escrow**: Cancels the escrow and returns the funds to the buyer.

## Functions

### create_escrow

```move
public fun create_escrow<CoinType>(
    account: &signer,
    seller: address,
    buyer: address,
    amount: u64,
)
```

- **account**: The signer account creating the escrow.
- **seller**: The address of the seller.
- **buyer**: The address of the buyer.
- **amount**: The amount of funds to be held in escrow.

This function transfers the specified amount from the signer's account to the escrow and initializes the `Escrow` struct.

### release_funds

```move
public fun release_funds<CoinType>(account: &signer) acquires Escrow
```

- **account**: The signer account requesting the release of funds.

This function releases the funds from the escrow to the seller and marks the escrow as completed.

### cancel_escrow

```move
public fun cancel_escrow<CoinType>(account: &signer) acquires Escrow
```

- **account**: The signer account requesting the cancellation of the escrow.

This function cancels the escrow and returns the funds to the buyer. The escrow is then marked as completed.

## Usage

### Prerequisites

- [Aptos CLI](https://aptos.dev/cli-tools/aptos-cli/)
- Move language toolchain

### Deployment

1. Clone the repository:
    ```sh
    git clone https://github.com/your-repo/escrow-contract.git
    cd escrow-contract
    ```

2. Compile the contract:
    ```sh
    aptos move compile --save-metadata
    ```

3. Publish the contract to the Aptos blockchain:
    ```sh
    aptos move publish --private-key <path-to-private-key> --url <aptos-node-url>
    ```

### Interacting with the Contract

1. **Create Escrow**:
    ```sh
    aptos move run --function-id 'escrow_program::escrowContract::create_escrow' --args <seller-address> <buyer-address> <amount>
    ```

2. **Release Funds**:
    ```sh
    aptos move run --function-id 'escrow_program::escrowContract::release_funds'
    ```

3. **Cancel Escrow**:
    ```sh
    aptos move run --function-id 'escrow_program::escrowContract::cancel_escrow'
    ```

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.

## Contact

For any inquiries, please contact [mail(mailto:poddararka27@gmail.com).

---

By using this escrow contract, you agree to the terms and conditions outlined in the [LICENSE](LICENSE) file.

---

This README provides an overview and usage instructions for the escrow smart contract. If you have any questions or need further assistance, please feel free to reach out.

---

Happy coding!
