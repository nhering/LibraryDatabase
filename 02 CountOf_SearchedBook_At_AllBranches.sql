CREATE PROCEDURE CountOf_SearchedBook_At_AllBranches @SearchedBook varchar(75)
AS

SELECT BC.No_Of_Copies, B.Title, LB.BranchName
FROM BOOK_COPIES AS BC
	INNER JOIN BOOK AS B
	ON BC.BookId = B.BookId
	INNER JOIN LIBRARY_BRANCH AS LB
	ON BC.BranchId = LB.BranchId
WHERE B.Title = @SearchedBook