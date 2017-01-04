CREATE PROCEDURE BorrowerInfo_By_NumberOfBooksOut @NumberOut INT = 5
AS

SELECT B.Name, B.[Address], COUNT(BL.BookId) AS BooksOut
	FROM BORROWER AS B
	INNER JOIN BOOK_LOANS AS BL
	ON B.CardNo = BL.CardNo
GROUP BY B.Name, B.[Address]
HAVING COUNT(BL.BookId) > 5