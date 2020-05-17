class Chattype(object):
    CONTENTCHAT = 1
    GROUPCHAT = 2
    SECRETCHAT = 3
    INDIVIDUALCHAT = 4
    CHOICES = (
        (CONTENTCHAT, "Contentchat"),
        (GROUPCHAT, "Groupchat"),
        (SECRETCHAT, "Secretchat"),
        (INDIVIDUALCHAT, "Individualchat"),
    )

class SeenStatus(object):
    DELIVERED = 1
    SEEN = 2
    NOTDELIVERED = 3
    CHOICES = (
        (DELIVERED, "Delivered"),
        (SEEN, "Seen"),
        (NOTDELIVERED, "Notdelivered"),
    )