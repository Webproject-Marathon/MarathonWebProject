from re import X
from django.core.management.base import BaseCommand
from mainapp import models
from mainapp import db_data
import datetime as dt
from django.contrib.auth.hashers import make_password




def populate_country():
    data = [
        ('AND','Andorra','flag_andorra.png'),('ARG','Argentina','flag_argentina.png'),('AUS','Australia','flag_australia.png'),('AUT','Austria','flag_austria.png'),('BEL','Belgium','flag_belgium.png'),('BOT','Botswana','flag_botswana.png'),('BRA','Brazil','flag_brazil.png'),('BUL','Bulgaria','flag_bulgaria.png'),('CAF','Central African Republic','flag_central_african_republic.png'),('CAN','Canada','flag_canada.png'),('CHI','Chile','flag_chile.png'),('CHN','China','flag_china.png'),('CIV','Ivory Coast','flag_ivory_coast.png'),('CMR','Cameroon','flag_cameroon.png'),('COL','Colombia','flag_colombia.png'),('CRO','Croatia','flag_croatia.png'),('CZE','Czech Republic','flag_czech_republic.png'),('DEN','Denmark','flag_denmark.png'),('DOM','Dominican Republic','flag_dominican_republic.png'),('ECU','Ecuador','flag_ecuador.png'),('EGY','Egypt','flag_egypt.png'),('ESA','El Salvador','flag_el_salvador.png'),('ESP','Spain','flag_spain.png'),('EST','Estonia','flag_estonia.png'),('FIN','Finland','flag_finland.png'),('FRA','France','flag_france.png'),('GBR','United Kingdom','flag_united_kingdom.png'),('GBS','Guinea-Bissau','flag_guinea.png'),('GEQ','Equatorial Guinea','flag_equatorial_guinea.png'),('GER','Germany','flag_germany.png'),('GRE','Greece','flag_greece.png'),('GUA','Guatemala','flag_guatemala.png'),('GUI','Guinea','flag_guinea-bissau.png'),('HKG','Hong Kong','flag_hong_kong.png'),('HON','Honduras','flag_honduras.png'),('HUN','Hungary','flag_hungary.png'),('INA','Indonesia','flag_indonesia.png'),('IND','India','flag_india.png'),('IRL','Ireland','flag_ireland.png'),('ISR','Israel','flag_israel.png'),('ITA','Italy','flag_italy.png'),('JAM','Jamaica','flag_jamaica.png'),('JOR','Jordan','flag_jordan.png'),('JPN','Japan','flag_japan.png'),('KEN','Kenya','flag_kenya.png'),('KOR','South Korea','flag_south_korea.png'),('KSA','Saudi Arabia','flag_saudi_arabia.png'),('LAT','Latvia','flag_latvia.png'),('LIE','Liechtenstein','flag_liechtenstein.png'),('LTU','Lithuania','flag_lithuania.png'),('LUX','Luxembourg','flag_luxembourg.png'),('MAC','Macau','flag_macau.png'),('MAD','Madagascar','flag_madagascar.png'),('MAS','Malaysia','flag_malaysia.png'),('MDA','Moldova','flag_moldova.png'),('MEX','Mexico','flag_mexico.png'),('MKD','Macedonia','flag_macedonia.png'),('MLI','Mali','flag_mali.png'),('MLT','Malta','flag_malta.png'),('MNE','Montenegro','flag_montenegro.png'),('MON','Monaco','flag_monaco.png'),('MRI','Mauritius','flag_mauritius.png'),('NCA','Nicaragua','flag_nicaragua.png'),('NED','Netherlands','flag_netherlands.png'),('NIG','Niger','flag_niger.png'),('NOR','Norway','flag_norway.png'),('NZL','New Zealand','flag_new_zealand.png'),('PAN','Panama','flag_panama.png'),('PAR','Paraguay','flag_paraguay.png'),('PER','Peru','flag_peru.png'),('PHI','Philippines','flag_philippines.png'),('POL','Poland','flag_poland.png'),('POR','Portugal','flag_portugal.png'),('PUR','Puerto Rico','flag_puerto_rico.png'),('QAT','Qatar','flag_qatar.png'),('ROU','Romania','flag_romania.png'),('RSA','South Africa','flag_south_africa.png'),('RUS','Russia','flag_russia.png'),('SEN','Senegal','flag_senegal.png'),('SIN','Singapore','flag_singapore.png'),('SUI','Switzerland','flag_switzerland.png'),('SVK','Slovakia','flag_slovakia.png'),('SWE','Sweden','flag_sweden.png'),('THA','Thailand','flag_thailand.png'),('TPE','Chinese Taipei','flag_chinese_taipei.png'),('TUR','Turkey','flag_turkey.png'),('UAE','United Arab Emirates','flag_united_arab_emirates.png'),('URU','Uruguay','flag_uruguay.png'),('USA','United States','flag_usa.png'),('VAT','Vatican','flag_vatican.png'),('VEN','Venezuela','flag_venezuela.png'),('VIE','Vietnam','flag_vietnam.png')
    ]
    Country = models.Country
    Country.objects.bulk_create([
        Country(
            name=name,
            code=code,
            flag=f'{Country.IMAGES_PATH}/{image_filename}'
        )
        for (code, name, image_filename) in data
    ])

def populate_event_type():
    EventType = models.EventType
    EventType.objects.bulk_create([
        EventType(name='Full Marathon'),
        EventType(name='5km Fun Run'),
        EventType(name='Half Marathon')
    ])


def populate_marathon():
    Marathon = models.Marathon
    Country = models.Country
    data = [
        ('Marathon Skills 2011','York','GBR',2011),
        ('Marathon Skills 2012','Hanoi','VIE',2012),
        ('Marathon Skills 2013','Leipzig','GER',2013),
        ('Marathon Skills 2014','Osaka','JPN',2014),
        ('Marathon Skills 2015','Sao Paulo','BRA',2015)
    ]
    Marathon.objects.bulk_create([
        Marathon(
            name=name,
            city_name=city_name,
            country=Country.objects.get(code=country_code),
            year_held=year
        ) for (name, city_name, country_code, year) in data
    ])
    

def populate_genders():
    Gender = models.Gender

    Gender.objects.bulk_create([
        Gender(name='Male'),
        Gender(name='Female')
    ])


def populate_event():
    Event = models.Event
    EventType = models.EventType
    Marathon = models.Marathon
    data = [('11_1FM','Ouse Marathon','FM',1,'2011-08-09 09:00:00',135.00,500),('11_1FR','Humber Fun Run','FR',1,'2011-08-10 10:00:00',15.00,800),('11_1HM','Foss Half Marathon','HM',1,'2011-08-09 14:00:00',70.00,650),('12_2FR','Hanoi 5km Fun Run','FR',2,'2012-06-16 15:00:00',25.00,1500),('12_2HM','Hanoi Half Marathon','HM',2,'2012-06-16 10:00:00',55.00,1500),('13_3FM','Bach Full Marathon','FM',3,'2013-08-25 10:00:00',130.00,1250),('13_3HM','Wagner Half Marathon','HM',3,'2013-08-25 09:00:00',70.00,800),('14_4FM','Honshu Marathon','FM',4,'2014-05-07 09:00:00',160.00,2680),('14_4FR','Honshu Fun Run','FR',4,'2014-05-08 11:00:00',20.00,1500),('14_4HM','Honshu Half Marathon','HM',4,'2014-05-08 09:00:00',60.00,2680),('15_5FM','Samba Full Marathon','FM',5,'2015-09-05 06:00:00',145.00,2200),('15_5FR','Capoeira 5km Fun Run','FR',5,'2015-09-06 15:00:00',20.00,5000),('15_5HM','Jongo Half Marathon','HM',5,'2015-09-06 07:00:00',75.00,2500)]
    event_type_id = {
        'FM': 1,
        'FR': 2,
        'HM': 3
    }
    Event.objects.bulk_create([
        Event(
            name=name,
            code=code,
            event_type=EventType.objects.get(pk=event_type_id[event_type_code]), 
            marathon=Marathon.objects.get(pk=marathon_id),
            start_date_time=start_date_time,
            cost=cost,
            max_participants=max_participants
        ) for (code, name, event_type_code, marathon_id, start_date_time, cost, max_participants) in data
    ])

def populate_registration_status():
    RegistrationStatus = models.RegistrationStatus
    data = ['Registered', 'Payment Confirmed', 'Race Kit Sent', 'Race Attended']
    RegistrationStatus.objects.bulk_create([
        RegistrationStatus(status=status) for status in data
    ])

def populate_race_kit_option():
    RaceKitOption = models.RaceKitOption
    data = [
        ('Runner\'s bib + RFID bracelet',0.00),
        ('Option A + hat + water bottle',20.00),
        ('Option B + T-shirt + souvenir booklet',45.00)
    ]
    RaceKitOption.objects.bulk_create([
        RaceKitOption(race_kit_option=option, cost=cost) for (option, cost) in data
    ])

def populate_charity():
    Charity = models.Charity
    data = [(1,'Arise','Arise supports women and children who have experienced domestic violence, enabling them to rebuild their lives. The impact of domestic violence is far reaching, impacts the whole community and can continue for generations.\n\nFor over 20 years, Arise has provided services that include:\n- Risk assessments and finding safe accommodation\n- Providing information on domestic violence services, legal advice, financial counselling, health services and support groups\n- Legal and court support\n\nSupport Arise to make a better future for women and children.','arise-logo.png'),(2,'Aves do Brasil','You can help save birds that are considered critically endangered and at risk of extinction in the wild.\n\nThe endangered birds include the black-hooded ant wren, the cherry-throated tanager, the fringe-backed fire-eye and the south-eastern rufous-vented ground-cuckoo.\n\nYour donations can help protect Brazil\'s Cerrado region, a unique savannah area where many at risk species are found.','aves-do-brazil-logo.png'),(3,'Clara Santos Oliveira Institute','The Clara Santos Oliveira Institute is a non-governmental, non-profit organisation based in Sao Paulo.  Clara founded the institute in 1986 to provide shelter and education to young people who have been through the juvenile court. Today there are five houses in Sao Paulo and we want to expand and set up another three by 2020.','clara-santos-oliveira-institute-logo.png'),(4,'Conquer Cancer - Brazil','Conquer Cancer Brazil (CCB) is dedicated to helping discover the treatments and cures for cancer by funding world class research within Brazil. We raise funds exclusively for research into the prevention, diagnosis and treatments for ALL types of cancer, in centres right across Brazil.\n\nHelp us work to change the lives of millions of people.','conquer-cancer-brazil.png'),(5,'Diabetes Brazil','Diabetes Brazil is committed to reducing the impact of diabetes through education, early detection and support.\n\nDiabetes is the leading cause of adult blindness, of kidney failure and increases the risk of heart attacks and strokes by up to 400%.\n\nYour support helps us to continue our life-saving work.','diabetes-brazil-logo.png'),(6,'Heart Health São Paulo','For over 50 years, Heart Health São Paulo has been dedicated to saving lives by making a difference to the heart health of our people. Donations help us fund valuable research, develop guidelines for health professionals, support patient care and help Paulistas to live healthier lifestyles.','heart-health-sao-paulo-logo.png'),(7,'Human Rights Centre  - São Paulo','The Human Rights Centre protects and promotes human rights in Brazil and in Brazilian activities overseas.  This is done through legal action, advocacy and research. The HRC is an independent, not-for-profit, non-government organisation and is a registered charity.\n\nWe work with community organisations, law firms, academics and other experts in the field of domestic and international human rights.','human-rights-centre-logo.png'),(8,'Stay Pumped','Stay Pumped is a charity that helps retired professional sports people who often struggle to adjust to life after sport.  Many are underprepared, lacking education and life skills required to make the enormous adjustment.  They often have the added burden of injury.\n\nStay Pumped is staffed by professionals and volunteers.  We rely on donations to carry out this most necessary work.','stay-pumped-logo.png'),(9,'Upbeat SP','Upbeat SP is a not-for-profit organisation that offers support for those suffering from mood disorders such as depression and bipolar disorder. In addition we conduct research studies to help with the understanding of mood disorders.  Our latest project is working to use technology to solve mental health issues. We are looking at social media as an indicator of mental health, and also at using mobile phones to measure mental health.\n\nHelp us continue the great work we are doing.','upbeat-logo.png'),(10,'WWSM Rescue','The small WWSM Rescue organisation works tirelessly devoting itself to the preservation of the White Whiskered Spider Monkey. Deforestation and conversion of land for agriculture has severely impacted on this monkey\'s home.  Unfortunately they are also hunted and have been pushed to the brink of extinction.\n\nWWSM Rescue needs your help to raise the profile of the white whiskered spider monkey in local communities.','wwsm-rescue-logo.png'),(11,'The Red Cross','Relief in times of crisis, care when it\'s needed most and commitment when others turn away. Red Cross is there for people in need, no matter who you are, no matter where you live.\n\nThe Red Cross Red Crescent Movement helps tens of millions of people around the world each year and we also care for local communities in our local country and further afield.\n\nWith millions of volunteers worldwide and thousands of members, volunteers and supporters, we can reach people and places like nobody else.','the-red-cross-logo.png'),(12,'Oxfam International','Oxfam is an international confederation of 17 organizations working together with partners and local communities in more than 90 countries.\n\nOne person in three in the world lives in poverty. Oxfam is determined to change that world by mobilizing the power of people against poverty.\n\nAround the globe, Oxfam works to find practical, innovative ways for people to lift themselves out of poverty and thrive. We save lives and help rebuild livelihoods when crisis strikes. And we campaign so that the voices of the poor influence the local and global decisions that affect them.\n\nIn all we do, Oxfam works with partner organizations and alongside vulnerable women and men to end the injustices that cause poverty.','oxfam-international-logo.png'),(13,'Save the Children Fund','Save the Children is the world\'s leading independent organisation for children. We work in around 120 countries. We save children\'s lives; we fight for their rights; we help them fulfil their potential.\n\nWe work to inspire breakthroughs in the way the world treats children and to achieve immediate and lasting change in their lives. Across all of our work, we pursue several core values: accountability, ambition, collaboration, creativity and integrity.\n\nIn 2014, we reached over 55 million children directly through our and our partners\' work.\n\nDonate now to help us how the children of the world.','save-the-children-fund-logo.png'),(14,'Querstadtein Berlin','querstadtein is the first project of Stadtsichten e.V., a registered non-profit association.\n\nAlthough it is visible everywhere in the city, homelessness is rarely discussed. On a theoretical level we often know very little about a topic that confronts us in the streets every day. Through querstadtein we would like to raise awareness of this issue.\n\nIt all started with the desire of our two founders to get something ‘real’ off the ground in Berlin, to actively tackle an issue instead of just thinking about it. Homeless people seemed to be everywhere, throughout the city and on the daily commute to the office. Some of them were there day in, day out, in the U-Bahn or on the street. The divide between the homeless people and the rest of society was striking. This is where we wanted to be active – to create a space which would facilitate encounters, exchange and awareness.\n\nWe would like your help to help the homeless in Berlin.','querstadtein-logo.png')]
    Charity.objects.bulk_create([
        Charity(
            name=name,
            description=description,
            logo=f'{Charity.IMAGES_PATH}/{logo_path}'
        )
        for (_, name, description, logo_path) in data
    ])


def populate_user_generic(use_password_hashing: bool, data):
    User = models.User
    
    def get_password(x):
        return make_password(x) if use_password_hashing else x

    User.objects.bulk_create([
        User(
            email=email,
            password=get_password(password),
            first_name=first_name,
            last_name=last_name,
            role=role
        )
        for (email, password, first_name, last_name, role) in data
    ])
    
def populate_user_with_password_hashing():
    populate_user_generic(True, db_data.good_users_data)

def populate_user_without_password_hashing():
    populate_user_generic(False, db_data.users_data)

def populate_runner():
    Runner = models.Runner
    Country = models.Country
    User = models.User
    Gender = models.Gender
    data = db_data.runners_data
    Runner.objects.bulk_create([
        Runner(
            user=User.objects.get(email=email),
            gender=Gender.objects.get(name=gender),
            date_of_birth=dt.date.fromisoformat(date_of_birth[:10]),
            country=Country.objects.get(code=country_code)
        )
        for (_, email, gender, date_of_birth, country_code) in data
    ])


def populate_registration():
    Registration = models.Registration
    Runner = models.Runner
    RaceKitOption = models.RaceKitOption
    RegistrationStatus = models.RegistrationStatus
    Charity = models.Charity
    data = db_data.registration_data
    race_kit_option_id = {
        'A': 1,
        'B': 2,
        'C': 3
    }

    Registration.objects.bulk_create([
        Registration(
            runner=Runner(pk=runner_id),
            date_time=date_time,
            race_kit_option=RaceKitOption(pk=race_kit_option_id[race_kit_option_code]),
            registration_status=RegistrationStatus(pk=registration_status_id),
            cost=cost,
            charity=Charity(pk=charity_id),
            sponsorship_target=sponsorship_target
        )
        for (_, runner_id, date_time, race_kit_option_code, registration_status_id, cost, charity_id, sponsorship_target) in data
        if runner_id <= 5088
    ])

def populate_registration_event():
    RegistrationEvent = models.RegistrationEvent
    Registration = models.Registration
    Event = models.Event
    data = db_data.registration_event_data

    RegistrationEvent.objects.bulk_create([
        RegistrationEvent(
            registration=Registration(pk=registration_id),
            event=Event.objects.get(code=event_code),
            bib_number=bib_number,
            race_time=race_number
        )
        for (_, registration_id, event_code, bib_number, race_number) in data
        if registration_id <= 5014
    ])

def populate_sponsorship():
    Sponsorship = models.Sponsorship
    Registration = models.Registration
    data = db_data.sponsorship_data
    Sponsorship.objects.bulk_create([
        Sponsorship(
            name=name,
            registration=Registration(pk=registration_id),
            amount=amount
        )
        for (_, name, registration_id, amount) in data
        if registration_id <= 5014
    ])


class Command(BaseCommand):
    help = 'Populate the database with initial data'

    def handle(self, *args, **kwargs):
        populators = [
            populate_genders,
            populate_country,
            populate_event_type,
            populate_marathon,
            populate_event,
            populate_registration_status,
            populate_race_kit_option,
            populate_charity,
            populate_user_with_password_hashing,
            populate_user_without_password_hashing,
            populate_runner,
            populate_registration,
            populate_registration_event,
            populate_sponsorship
        ]
        for p in populators:
            self.stdout.write(self.style.SUCCESS(f"Start executing: {p.__name__}"))
            p()
            self.stdout.write(self.style.SUCCESS(f'Complete executing: {p.__name__}'))
        self.stdout.write(self.style.SUCCESS('Database populated successfully'))
