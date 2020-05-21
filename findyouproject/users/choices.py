class ObjectStatusChoices(object):
    ACTIVE = 0
    DELETED = 1
    CHOICES = (
        (DELETED, 'Deleted'),
        (ACTIVE, 'Active')
    )


class CscType(object):
    COUNTRY = 1
    STATE = 2
    CITY = 3
    CHOICES = (
        (COUNTRY, "Country"),
        (STATE, "State"),
        (CITY, "City"),
    )