class CscType(object):
    COUNTRY = 1
    STATE = 2
    CITY = 3
    CHOICES = (
        (COUNTRY, "Country"),
        (STATE, "State"),
        (CITY, "City"),
    )

class ContentType(object):
    VIDEO = 1
    IMAGE = 2
    MP3 = 3
    TEXTPOST = 4
    SECRETPOST = 5
    PDF = 6
    CHOICES = (
        (VIDEO, "Video"),
        (IMAGE, "Image"),
        (MP3, "Mp3"),
        (TEXTPOST, "Textpost"),
        (SECRETPOST, "Secretpost"),
        (PDF, "Pdf"),
    )

class ContentCategory(object):
    NEWS = 1
    ENTERTAINMENT = 2
    MYPROFILE = 3
    SPORTS = 4
    TALENT = 5
    SECRET = 6
    BUYANDSELL = 7
    ASKFROMPEOPLE = 8
    SHORTMOVIES=9
    MUSIC=10
    WORK = 11
    REVIEW = 12
    HOWTO = 13
    LOVE=14
    KIDS = 15
    HOMESERVICE = 16
    BEAUTY = 17
    TRAVEL = 18
    AUTOMOBILE = 19
    FOOD = 20
    CINEMA = 21
    EXPLOREINDIA = 22
    NATURE = 23
    WILDLIFE = 24
    FASHION = 25
    ART = 26
    TECH = 27
    HEALTH = 28
    FITNESS = 29
    INSPIRINGCREATOR = 30
    MOTIVATIONAL = 31
    DAILYONGOING = 32
    CHOICES = (
        (NEWS, "News"),
        (ENTERTAINMENT, "Entertainment"),
        (DAILYONGOING, "Daily Ongoing"),
        (MYPROFILE, "My Profile"),
        (SPORTS, "Sports"),
        (TALENT, "Talent"),
        (SECRET, "Secret"),
        (BUYANDSELL, "Buy/Sell"),
        (ASKFROMPEOPLE, "Ask From People"),
        (SHORTMOVIES, "Short Movies"),
        (MUSIC, "Music"),
        (WORK, "Work"),
        (REVIEW, "review"),
        (HOWTO, "How To"),
        (LOVE, "love"),
        (KIDS, "Kids"),
        (HOMESERVICE, "Home Service"),
        (BEAUTY, "Beauty"),
        (TRAVEL, "Travel"),
        (AUTOMOBILE, "Automobile"),
        (FOOD, "Food"),
        (CINEMA, "Cinema"),
        (EXPLOREINDIA, "Explore India"),
        (NATURE, "Nature"),
        (WILDLIFE, "Wildlife"),
        (FASHION, "Fashion"),
        (ART, "Art"),
        (TECH, "Tech"),
        (HEALTH, "Health"),
        (FITNESS, "Fitness"),
        (INSPIRINGCREATOR, "Inspiring Creator"),
        (MOTIVATIONAL, "Motivational"),
    )

