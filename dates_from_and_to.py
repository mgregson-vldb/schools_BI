from datetime import date
from dateutil.relativedelta import relativedelta

current_date = date.today()

two_yrs_ago = current_date - relativedelta(years=3)

# dd/mm/YY
today = current_date.strftime("%Y-%m-%d")

end_range = two_yrs_ago.strftime("%Y-%m-%d")


def dates_range_for_params():
    date_from = today
    date_to = end_range
