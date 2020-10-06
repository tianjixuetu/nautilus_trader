# -------------------------------------------------------------------------------------------------
#  Copyright (C) 2015-2020 Nautech Systems Pty Ltd. All rights reserved.
#  https://nautechsystems.io
#
#  Licensed under the GNU Lesser General Public License Version 3.0 (the "License");
#  You may not use this file except in compliance with the License.
#  You may obtain a copy of the License at https://www.gnu.org/licenses/lgpl-3.0.en.html
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
# -------------------------------------------------------------------------------------------------

from cpython.datetime cimport date

from nautilus_trader.model.c_enums.price_type cimport PriceType
from nautilus_trader.model.currency cimport Currency
from nautilus_trader.model.identifiers cimport Symbol


cdef class ExchangeRateCalculator:
    cpdef double get_rate(
            self,
            Currency from_currency,
            Currency to_currency,
            PriceType price_type,
            dict bid_rates,
            dict ask_rates
    ) except *


cdef class RolloverInterestCalculator:
    cdef ExchangeRateCalculator _exchange_calculator
    cdef dict _rate_data

    cpdef object get_rate_data(self)
    cpdef double calc_overnight_rate(self, Symbol symbol, date timestamp) except *