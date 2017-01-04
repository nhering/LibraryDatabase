CREATE PROCEDURE BorrowerInfoAndBooksOut_By_Branch_And_DateDue
	@SearchedBranch varchar(30) = 'Sharpstown',
	@SearchedDueDate date = NULL
AS

IF @SearchedDueDate IS NULL
SET @SearchedDueDate = CONVERT(date,GETDATE())

SELECT BL.DateDue, Bo.Title, B.Name, B.Address
FROM LIBRARY_BRANCH AS LB
	INNER JOIN BOOK_LOANS AS BL
	ON LB.BranchId = BL.BranchId
	INNER JOIN BORROWER AS B
	ON BL.CardNo = B.CardNo
	INNER JOIN BOOK AS Bo
	ON BL.BookId = Bo.BookId
WHERE LB.BranchName = @SearchedBranch
	AND BL.DateDue = @SearchedDueDate
ORDER BY BL.DateDue DESC
