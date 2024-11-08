const db = require('../models');

const likeController = {
    // API thêm like
    themLike: async (req, res) => {
        try {
            const { users_id, foods_id } = req.body;
            
            // Kiểm tra xem đã like chưa
            const daLike = await db.Like.findOne({
                where: { users_id, foods_id }
            });

            if (daLike) {
                return res.status(400).json({ message: "Đã like món ăn này rồi" });
            }

            // Thêm like mới
            await db.Like.create({ users_id, foods_id });
            res.status(201).json({ message: "Like thành công" });
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    },

    // API xóa like
    xoaLike: async (req, res) => {
        try {
            const { users_id, foods_id } = req.body;
            
            const ketQua = await db.Like.destroy({
                where: { users_id, foods_id }
            });

            if (ketQua === 0) {
                return res.status(404).json({ message: "Không tìm thấy like để xóa" });
            }

            res.status(200).json({ message: "Unlike thành công" });
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    },

    // API lấy danh sách like theo món ăn
    layLikeTheoMonAn: async (req, res) => {
        try {
            const { foods_id } = req.params;
            
            const danhSachLike = await db.Like.findAll({
                where: { foods_id }
            });

            res.status(200).json(danhSachLike);
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    },

    // API lấy danh sách like theo người dùng
    layLikeTheoNguoiDung: async (req, res) => {
        try {
            const { users_id } = req.params;
            
            const danhSachLike = await db.Like.findAll({
                where: { users_id }
            });

            res.status(200).json(danhSachLike);
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    }
};

module.exports = likeController;
