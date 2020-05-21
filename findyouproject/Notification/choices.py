class ObjectStatusChoices(object):
    ACTIVE = 0
    DELETED = 1
    CHOICES = (
        (DELETED, 'Deleted'),
        (ACTIVE, 'Active')
    )