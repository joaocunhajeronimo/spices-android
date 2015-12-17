# Zucchini
_A structured layer between Cucumber and Calabash_

Zucchini is software layer written in Ruby that is located between Cucumber and Calabash.

## Usage

### Writing Step Definitions

When writing step definitions the `Zucchini` class should always be your starting point. The class provides methods to access the different screens and products of the application. Every screen and product also provide different methods in order to interact with them.

Here's for instance, how to start the SDK

```gherkin
When /^I start the SDK$/ do
  Zucchini.application.start_screen.start_sdk
end
```

or how to close the Offer Wall

```gherkin
When /^I close the OfferWall$/ do
  Zucchini.sdk.offer_wall.close
end
```

### Feed the framework

The framework currently contains all the classes and methods needed to support the current state of the test suite. When writing new scenarios you might have to create screens or products or add methods to the existing ones.

At any time you can check the consistency of what you're adding to the framework by launching `irb` in the zucchini directory and requiring `zucchini.rb`

```shell
$ irb
2.2.2 :001 > require './zucchini'
 => true
```

#### Create Screens

Screens are located in the `application/screens` directory. They are basically classes inheriting from `BaseScreen`. If you ever have to create one, just create a file in this directory (e.g. `product_screen.rb`). This file should contain the following

```ruby
class ProductScreen < BaseScreen
  def do_stuff

  end
end
```

Then make sure to require the file and create a method that returns the screen in the `application.rb`

```ruby
require './application/screens/product_screen'

...

def product_screen
  ProductScreen.new
end
```

#### Interact with the application

In the methods you define in the screen classes, you will interact with the application using components.

You can create components based on their:
- accessibility label (iOS)
- text
- id (Android)

```ruby
button = Button.with_accessibility_label('StartSDK_Button')
label = Label.with_text('Offer available')
checkbox = Checkbox.with_id('UseStagingUrl_Checkbox')
```

Once you have created this components you can query them or one of their properties or interact with them

##### Query

In order to query a component, just call the `query` method on it

```ruby
button.query
```

This returns a hash containing properties of the queried component

```ruby
{
  "class"=>"UIButton",
  "frame"=>{
    "y"=>1,
    "width"=>76,
    "x"=>2,
    "height"=>48
  },
  "UIType"=>"UIControl",
  "description"=>"<UIButton: 0x856a820; frame = (2 1; 76 48); opaque = NO; layer = <CALayer: 0x856d210>>"
}
```

If you want to directly query properties of this component you can use the `query_properties` method

```
label.query_properties(:text)
```

This will return a string containing the text of the label

##### Interact

You can touch with components by calling the `touch` method on them

```
checkbox.touch
```

You can also interact differently depending on each component. For instance, the `TableView` and `WebView` components are both scrollable and therefore react to the `scroll_up` and `scroll_down` methods

```
table_view.scroll_up
web_view.scroll_down
```

##### Assert

You can also making sure a component is there or not

```ruby
web_view_element.displayed?
web_view_element.not_displayed?
```
and even wait for it to be displayed

```ruby
web_view_element.wait_for_displayed
web_view_element.wait_for_not_displayed
```

#### Misc

Some components include specific methods

##### Alert

The Alert component has a custom initialize that allows you to find it based on its title and message

```ruby
alert = Alert.with_title_and_msg(alert_title, alert_msg)
```

##### Switch

You can switch a switch on or off

```ruby
switch.on # the switch is on
switch.off
```

##### Webview

You can query web view object based on their CSS

```
web_view.element_with_css '.x-close'
```
