require "capybara_angular_helpers/version"
require 'rspec/core'

module CapybaraAngularHelpers
  def ng_fill_in(target, opts)
    if opts.is_a?(Fixnum)
      opts = opts.to_s
    end

    if opts.is_a?(String) || opts.is_a?(TrueClass) || opts.is_a?(FalseClass)
      opts = { with: opts }
    end

    selector = [
      "input[ng-model='#{target}']",
      "textarea[ng-model='#{target}']",
      "select[ng-model='#{target}']",
    ].join(',')

    if element_index = opts[:index]
      target_element = all(selector)[element_index]

      if !target_element
        raise "#{target} could not be found"
      end
    else
      target_element = find(:css, selector)
    end

    if target_element.tag_name == 'select'
      target_element.find(:option, opts[:with]).select_option
    else
      target_element.set(opts[:with])
    end
  end

  def ng_toggle(target)
    find(:css, "div[ng-model='#{target}'] .toggle").click
  end

  def ng_click_on(target, opts = {})
    selector = [
      '*[ui-sref]',
      '*[ng-click]',
      '*[menu-toggle]',
      '.tab-item',
      'button',
    ].join(',')

   if element_index = opts[:index]
     target_element = all(selector, text: target)[element_index]

     if !target_element
       raise "#{target} could not be found"
     end
   else
     target_element = find(:css, selector, text: target)
   end

   target_element.click
  end

  def ng_ionic_click_left_nav
    left_nav_button = begin
      find('ion-header-bar .buttons-left button')
    rescue Capybara::ElementNotFound
      find('ion-header-bar .back-button')
    end

    left_nav_button.click
  end

  def ng_ionic_click_right_nav
    find('ion-header-bar .buttons-right button').click
  end

  def ng_ionic_list_item_click_on(list_item_text, button_text = nil)
    if button_text.nil?
      # find(:xpath, "//ion-side-menu-content/descendant::ion-item/descendant-or-self::*[contains(text(), '#{target}')]/ancestor-or-self::ion-item").click
      find(:xpath, "//ion-side-menu-content/descendant::ion-item/descendant-or-self::*[text()[contains(., '#{list_item_text}')]]/ancestor-or-self::ion-item").click
    else
      find(:xpath, "//ion-side-menu-content/descendant::ion-item/descendant-or-self::*[text()[contains(., '#{list_item_text}')]]/ancestor-or-self::ion-item/descendant-or-self::*[text()[contains(., '#{button_text}')]]").click
    end
  end
end

RSpec.configure do |config|
  config.include CapybaraAngularHelpers, type: :feature
end
