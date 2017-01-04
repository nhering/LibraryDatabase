CREATE PROCEDURE BooksBy_SearchedAuthor_At_SearchedBranch @SearchedAuthor varchar(40) = "Stephen King", @SearchedBranch varchar(30) = "Central"
AS

SELECT B.Title, BC.No_Of_Copies
	FROM BOOK AS B
	INNER JOIN BOOK_COPIES AS BC
	ON B.BookId = BC.BookId
	INNER JOIN BOOK_AUTHORS AS BA
	ON BC.BookId = BA.BookId
	INNER JOIN LIBRARY_BRANCH AS LB
	ON BC.BranchId = LB.BranchId
WHERE BA.AuthorName = @SearchedAuthor
and LB.BranchName = @SearchedBranch