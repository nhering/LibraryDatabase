CREATE PROCEDURE CountOf_BooksOut_AllBranches
AS

SELECT LB.BranchName, COUNT(BL.BranchId) AS 'Book Loans'
	FROM BOOK_LOANS AS BL
		INNER JOIN Library_Branch AS LB
		ON BL.BranchId = LB.BranchId
	GROUP BY LB.BranchName