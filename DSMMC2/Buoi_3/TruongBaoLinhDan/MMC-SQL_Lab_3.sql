
USE testingsystem;
-- Question 1: Thêm ít nhất 10 record vào mỗi table
INSERT INTO `Account`(Email								, Username			, FullName				, DepartmentID	, PositionID, CreateDate)
VALUES 				('dapphatchetngay1@gmail.com'		, 'khabanh1'			,'Ngo Ba Kha'			,   '6'			,   '3'		,'2020-04-05'),
                    ('songcodaoly@gmail1.com'			, 'huanhoahong1'		,'Bui Xuan Huan'		,   '7'			,   '2'		, NULL		),
                    ('sontungmtp@gmail1.com'			, 'tungnui1'			,'Nguyễn Thanh Tùng Anh',   '8'			,   '1'		,'2020-04-07'),
                    ('duongghuu@gmail1.com'				, 'duongghuu1'			,'Nguyễn Thanh Anh Tùng',   '9'			,   '2'		,'2020-04-07'),
                    ('vtiaccademy@gmail1.com'			, 'vtiaccademy1'		,'Vi Ti Ai'				,   '10'		,   '1'		,'2020-04-09');

-- Question 2: Lấy ra tất cả các phòng ban Departmen
SELECT * 
FROM Department;

-- Question 3: Lấy ra id của phòng ban "Sale"
SELECT DepartmentID
FROM Department
WHERE departmentName = N'Sale';  

-- Question 4: lấy ra thông tin account có full name dài nhất
SELECT * 
FROM `account`;

SELECT FullName 
FROM `account`;

SELECT LENGTH(FullName)
FROM `account`;

SELECT MAX(LENGTH(FullName))
FROM `account`;

SELECT FullName
FROM `account`
WHERE LENGTH(FullName) = (	SELECT MAX(LENGTH(FullName))
							FROM `account`
							);
SELECT *
FROM `account`
WHERE LENGTH(FullName) = (	SELECT MAX(LENGTH(FullName))
							FROM `account`);
						
-- Question 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id = 3
SELECT *
FROM `account`
WHERE LENGTH(FullName) = (	SELECT MAX(LENGTH(FullName))
							FROM `account`
							) AND DepartmentID = 9 ;
							
-- Question 6: Lấy ra tên group đã tham gia sau ngày 2020-04-01
SELECT 	*
FROM 	`Group`;

SELECT 	*
FROM 	`Group`
WHERE	CreateDate > '2020-04-01';

SELECT 	GroupName
FROM 	`Group`
WHERE	CreateDate > '2020-04-01';

-- Question 7: Lấy ra ID của question có >= 4 câu trả lời
SELECT 	* 
FROM 	Answer;
-- Lấy ra số lượng của QuestionId
SELECT		QuestionId, count(QuestionId) AS 'SL'
FROM		Answer
GROUP BY	QuestionId;

SELECT		QuestionId, count(QuestionId) AS 'SL'
FROM		Answer
GROUP BY	QuestionId
HAVING		count(QuestionId) >= 4;

-- Question 8: Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 20/12/2019
SELECT 	* 
FROM 	exam;
SELECT 	* 
FROM 	exam
WHERE 	Duration >= 60 AND CreateDate < '2019-12-20';

-- Question 9: Lấy ra 5 group được tạo gần đây nhất

SELECT		*
FROM		`Group`
ORDER BY	CreateDate DESC
LIMIT		5;

-- Question 10: Đếm số nhân viên thuộc department có id = 2
SELECT		*
FROM		department
WHERE 		DepartmentID = 2; -- sale

SELECT		* 
FROM		`Account`;

SELECT		DepartmentID, count(DepartmentID) 
FROM		`Account`
GROUP BY	DepartmentID
HAVING		DepartmentID = 2;

-- Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o" 
SELECT	FullName
From	`Account`;

-- Lấy Họ
SELECT	SUBSTRING_INDEX(FullName,' ', 1)
From	`Account`;

-- Lấy tên
SELECT	SUBSTRING_INDEX(FullName,' ', -1)
From	`Account`;

SELECT	*
From	`Account`
WHERE	SUBSTRING_INDEX(FullName,' ',-1) LIKE 'D%o';

-- Question 12: Xóa tất cả các exam được tạo trước ngày 20/12/2019
SELECT	*
From	Exam;

DELETE 
FROM 	Exam
WHERE	'CreateDate'>='2019-12-20';
-- Question 13: Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi"
-- Trả về 2 phần tử đầu trong câu hỏi
SELECT	SUBSTRING_INDEX(Content,' ',2)
FROM 	Question;
-- Trả về các question có nội dung bắt đầu bằng từ "câu hỏi"
SELECT	*
FROM 	Question
WHERE	SUBSTRING_INDEX(Content,' ',2) = 'câu hỏi';

DELETE
FROM 	Question
WHERE	SUBSTRING_INDEX(Content,' ',2) = 'câu hỏi';

-- Question 14: Update thông tin của account có id = 5 thành tên "Lô Văn Đề" và
-- email thành lo.vande@mmc.edu.vn
SELECT	*
From	`Account`
WHERE 	AccountID = 5;

UPDATE		`Account`
SET			Email = 'lo.vande@mmc.edu.vn', FullName = 'Lô Văn Đề'
WHERE		AccountID = 5;

-- Question 15: Update account có id = 5 sẽ thuộc group có id = 4
SELECT	*
FROM 	`GroupAccount`;

SELECT	*
FROM 	`GroupAccount`
WHERE 	AccountID = 5;

SELECT	*
FROM 	`GroupAccount`
WHERE 	GroupID = 4;

UPDATE		`GroupAccount`
SET			GroupId = 4 
WHERE		AccountID = 5;
