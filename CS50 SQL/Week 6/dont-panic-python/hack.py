from cs50 import SQL

# Kết nối đến database 
db = SQL("sqlite:///dont-panic.db")

# Hỏi người dùng nhập mật khẩu mới
password = input("Enter a password: ")

# Chạy lệnh UPDATE để đổi mật khẩu admin
db.execute(
    """
    UPDATE "users"
    SET "password" = ?
    WHERE "username" = 'admin';
    """,
    password
)
