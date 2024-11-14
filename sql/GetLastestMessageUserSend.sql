CREATE PROCEDURE GetLastestMessageUserSend
	@USER VARCHAR(20)
AS
BEGIN
SELECT m.Id, m.SenderID, m.ReceiverID, m.IsDeleted, m.content, m.is_read, m.Timestamp FROM Messages m JOIN
(
	SELECT SenderID, ReceiverID, MAX(Timestamp) as Lastest
	FROM Messages
	GROUP BY SenderID, ReceiverID
	HAVING SenderID = @USER
) AS LastestSend ON m.SenderID = LastestSend.SenderID AND m.ReceiverID = LastestSend.ReceiverID AND m.Timestamp = LastestSend.Lastest
WHERE m.IsDeleted = 0
END

/* new */
ALTER PROCEDURE GetLastestMessageUserSend
	@USER VARCHAR(20)
AS
BEGIN
SELECT m.Id, m.SenderID, m.ReceiverID, m.IsDeleted, m.content, m.is_read, m.Timestamp FROM Messages m JOIN
(
	SELECT SenderID, ReceiverID, MAX(Timestamp) as Lastest
	FROM Messages
	GROUP BY SenderID, ReceiverID
	HAVING SenderID = @USER
) AS LastestSend ON m.SenderID = LastestSend.SenderID AND m.ReceiverID = LastestSend.ReceiverID AND m.Timestamp = LastestSend.Lastest
WHERE m.IsDeleted = 0
ORDER BY m.Timestamp DESC
END
