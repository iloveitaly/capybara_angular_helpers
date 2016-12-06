# CapybaraAngularHelpers

Helpers for writing integration tests against Angular apps using capybara + rspec. Also includes helpers for the Ionic framework.

## Installation

```ruby
gem 'capybara_angular_helpers'
```

## Usage

```ruby
visit '/app/'

ng_click_on 'Sign up'

# if there are multiple buttons/link with the same title
ng_click_on 'Sign up', index: 1

ng_fill_in 'registration.email', with: 'parent@example.com'

# if there are multiple elements with the same model reference
ng_fill_in 'child.name', with: 'Fred', index: 0

ng_ionic_list_item_click_on 'List Item 1'

ng_ionic_click_right_nav
ng_ionic_click_left_nav

ng_toggle 'child.split_earnings'
```
