const express = require('express');
const cors = require('cors');
const db = require('./models');
const likeRoutes = require('./routes/like.routes');

const app = express();

// Middleware
app.use(cors());
app.use(express.json());

// Test database connection
db.sequelize.authenticate()
    .then(() => {
        console.log('Kết nối database thành công.');
    })
    .catch(err => {
        console.error('Lỗi kết nối database:', err);
    });

// Routes
app.use('/api/likes', likeRoutes);

// Test route
app.get('/', (req, res) => {
    res.json({ 
        message: "Welcome to Food App API",
        database: "db_app_food"
    });
});

// Khởi động server
const PORT = process.env.PORT || 8080;

// Sync database và start server
const startServer = async () => {
    try {
        await db.sequelize.sync();
        console.log("Đã đồng bộ database.");
        
        app.listen(PORT, () => {
            console.log(`Server đang chạy trên port ${PORT}`);
        });
    } catch (error) {
        console.error("Lỗi khởi động server:", error);
    }
};

startServer();
