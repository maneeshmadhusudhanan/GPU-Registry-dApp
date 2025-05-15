# GPU-Registry-dApp
Decentralized GPU Management &amp; Model Execution Tracker on Sui Blockchain
🚀 Sui Blockchain GPU Registry dApp | Developer Assessment
Decentralized GPU Management & Model Execution Tracker on Sui Blockchain

🌟 Project Highlights ✨

🎯 On-chain GPU Registration & Model Execution Tracking
🔹 Feature	🏆 Benefits
💻 GPU Registry	Store specs, availability, and ownership securely
🧠 Model Execution	Track usage, time, input/output data
🔁 Ownership Transfer	Assign GPUs across users
📊 Real-time Data	Execution history & statistics
🔧 Smart Contracts – Written in Move
📦 Module: gpu_registry::gpu_registry

🧠 GPU Struct:

    id: Unique UID

    model: String (e.g., RTX 4090)

    memory: u64 (GB)

    cuda_cores: u64

    memory_bandwidth: u64 (GB/s)

    compute_capability: String (e.g., "8.9")

    owner: Address

    is_available: bool

    registration_timestamp: u64

🛠️ Functions:

    register_gpu()

    update_gpu_availability()

    get_gpu_details()

    transfer_gpu_ownership()

🧠 Module: model_execution::model_execution

💾 ModelExecution Struct:

    id: UID

    model_hash: String

    gpu_id: ID (GPU reference)

    execution_timestamp: u64

    duration_ms: u64

    status: String (pending/running/completed/failed)

    executor: address

    input_size: u64 (bytes)

    output_size: u64 (bytes)

🛠️ Functions:

    create_execution()

    update_execution_status()

    get_execution_details()

    get_executions_by_gpu()

    get_executions_by_model()

🔥 Core Functionality
🖥️ GPU Management

✅ Register GPUs with full specs
✅ Toggle availability
✅ Transfer ownership
✅ Fetch detailed info
🚀 Model Execution Tracking

✅ Track ML execution status
✅ Filter by model, GPU, executor
✅ Monitor duration and size
✅ Emit custom blockchain events
🖼️ Events

// GPU Events
struct GPURegistered { gpu_id: ID, owner: address, model: String }
struct GPUAvailabilityChanged { gpu_id: ID, is_available: bool }

// Execution Events
struct ExecutionCreated { execution_id: ID, model_hash: String, gpu_id: ID, executor: address }
struct ExecutionCompleted { execution_id: ID, status: String, duration_ms: u64 }

🎨 Frontend (Next.js + Tailwind CSS + Sui.js)
💠 Pages & Components
🧾 GPU Registry Dashboard

    Full list of GPUs

    Filter by specs/owner/availability

    View individual GPU details

➕ Add GPU Form

    Input: Model, memory, cores, etc.

    Auto wallet ownership

    Real-time validation

📊 Model Execution Interface

    Select GPU

    Enter model hash

    Start & monitor execution

📂 Execution History

    Table view

    Filter by GPU/model/status

    Sort by timestamp/duration

👤 User Profile

    Wallet address

    Owned GPUs

    Execution stats

🛠️ Technology Stack
Layer	Tech
⚙️ Blockchain	Sui Blockchain + Move Language
📦 Contracts	gpu_registry + model_execution
💻 Frontend	Next.js 13+ + TypeScript
🎨 Styling	Tailwind CSS
📊 Charts	Chart.js
🔌 Wallet	Sui Wallet / Suiet
🔄 API	@mysten/sui.js
⚡ Data	React Query (real-time fetches)
🔌 Integration Requirements
🔐 Wallet Connection

✅ Connect via Sui Wallet / Suiet
✅ Show wallet state & address
✅ Handle disconnection gracefully
⚙️ Transaction Handling

    Proper success/failure notifications

    Error catch + retry flow

    Smooth loading UI

🔄 Real-time Fetching

    On-chain data sync

    Pagination support

    Instant updates on execution status

🚀 Advanced Features (Bonus)
⭐ Feature	⚡ Description
📈 GPU Benchmarking	On-chain benchmark scores
🔁 Execution Replay	Replay past model executions
🧩 Integration APIs	Export data via secure API
📸 Screenshots & Animations
🖥️ GPU Dashboard

Dashboard
🚀 Model Execution Tracker

Crypto Animation
🧪 Setup & Installation
⚡ Clone & Install

git clone https://github.com/your-username/sui-gpu-registry-dapp.git
cd sui-gpu-registry-dapp
npm install

⚡ Run the App

npm run dev

✅ Connect your wallet & test on Sui Devnet/Testnet.
👨‍💻 Contributing

🚀 Wanna help improve this project?

    Fork it

    Create a feature branch

    Push your changes

    Open a Pull Request 🎉

📩 Contact & Support

📧 Email: your-email@example.com
💬 Telegram: @YourTelegramID
🔗 GitHub Issues: Report an Issue
📜 License

MIT License – Feel free to modify & use with credits.
📅 Roadmap

✅ GPU Registry Core
✅ Model Execution Tracker
🔜 GPU Benchmarking
🔜 Mobile-first React Native dApp
🔜 Execution Analytics Dashboard

🌟 Empowering GPU Usage with Blockchain Transparency
🚀 Sui GPU Registry dApp – Track, Manage & Execute Decentralized!
