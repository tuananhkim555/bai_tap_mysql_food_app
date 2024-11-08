const express = require('express');
const router = express.Router();
const likeController = require('../controllers/like.controller');

router.post('/them-like', likeController.themLike);
router.delete('/xoa-like', likeController.xoaLike);
router.get('/mon-an/:foods_id', likeController.layLikeTheoMonAn);
router.get('/nguoi-dung/:users_id', likeController.layLikeTheoNguoiDung);

module.exports = router;
