# frozen_string_literal: true

require 'money'

Money.rounding_mode = BigDecimal::ROUND_HALF_EVEN
Money.locale_backend = :i18n
I18n.enforce_available_locales = false
