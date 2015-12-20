# Spices
_A structured layer that goes on top of Calabash_

Spices provides you with a structured class architecture to query and interact with Calabash

## Usage

### Create Components

With Spices, you can create components

```ruby
label = Label.with_text 'First View'
button = Button.with_accessibility_label 'Alert_Button'
textfield = Textfield.new
```

Once you have created this components you can query them or their properties or interact with them

### Query

In order to query a component, just call the `query` method on it

```ruby
$ label.query
{"id"=>nil, "description"=>"<UILabel: 0x7faa59f62190; frame = (109 313; 157.5 41.5); text = 'First View'; clipsToBounds = YES; opaque = NO; autoresize = RM+BM; userInteractionEnabled = NO; layer = <_UILabelLayer: 0x7faa59f5b930>>", "label"=>"First View", "frame"=>{"y"=>313, "x"=>109, "width"=>157.5, "height"=>41.5}, "accessibilityElement"=>true, "value"=>"First View", "alpha"=>1, "enabled"=>true, "visible"=>1, "text"=>"First View", "class"=>"UILabel", "rect"=>{"y"=>313, "center_x"=>187.75, "center_y"=>333.75, "x"=>109, "width"=>157.5, "height"=>41.5}}
```

### Visibility

You can also check if a component is visible or not

```ruby
$ label.visible?
true
$ textfield.not_visible?
true
```

It is a also possible to wait for an element to be visible or invisible before moving on to the next step

```ruby
# Will wait 30 seconds for the element to be displayed
$ label.wait_for_visible 30 
```

If you want to query properties of this component you can use the `[]` method

```
$ label['text']
"First View"
$ label['alpha']
1
```

It is also possible to set these properties

```
$ label['setText:', 'Main View']
"<VOID>"
# We changed the text so we need to reset the label variable
$ label = Label.with_text 'Main View'
$ label['setAlpha:', 0]
1
```

### Interact

You can touch with components by calling the `touch` method on them

```ruby
$ button.touch
```

Editing text components is also possible

```ruby
$ textfield.enter_text 'text'
"<UITextField: 0x7fb428d64dd0; frame = (90.5 388; 194.5 30); text = 'text'; clipsToBounds = YES; opaque = NO; autoresize = RM+BM; gestureRecognizers = <NSArray: 0x7fb428c91640>; layer = <CALayer: 0x7fb428d3a0d0>>"
```

You can also interact differently depending on each component. For instance, the `TableView` and `WebView` components are both scrollable and therefore react to the `scroll_up` and `scroll_down` methods

```ruby
$ table_view.scroll_to_bottom
$ web_view.scroll_down
```

CollectionViewCell and TableViewCell components can also be selected

```ruby
$ table_view_cell.select
"<VOID>"
$ table_view_cell.selected?
true
$ table_view_cell.deselect
"<VOID>"
```

### Misc

Some components include specific methods

#### Alert

The Alert component has a custom initialize that allows you to find it based on its title and message

```ruby
$ alert = Alert.with_title_and_msg(alert_title, alert_msg)
```

#### Switch

You can switch a switch on or off

```ruby
$ switch.on 
$ switch.on?
true
$ switch.off
$ switch.on?
false
```

#### Webview

You can query web view object based on their CSS or Xpath

```ruby
$ web_view = WebView.new
#<WebView:0x007fdca97ac410>
$ css_element = web_view.element_with_css '.sbox'
#<WebViewCssElement:0x007fdca97df568 @parent=#<WebView:0x007fdca97ac410>, @css=".sbox">
$ css_element.query
{"center"=>{"X"=>187, "Y"=>192}, "webView"=>"<UIWebView: 0x7f9bfb760400; frame = (-4 108; 383 510); autoresize = RM+BM; layer = <CALayer: 0x7f9bfb755eb0>>", "nodeName"=>"DIV", "id"=>"", "textContent"=>"            ×         ._Wig{display:inline-block;height:24px;position:relative;width:24px;z-index:0}._Wig span{background-color:currentColor;display:block;height:100%;-webkit-mask-size:100% 100%;width:100%}._yjg span{-webkit-mask-image:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAQAAAD9CzEMAAABl0lEQVR4Ae3Tz0obURSA8W+jkiZZpOts8mfbhCyCiKD0ORR9Df8b9RXcKH0NUaQ6irbSfQn4AJpnSAI5zeJw6GJmbu9t76Iwv2977pzMHUKhEFmPMx4YMZk3IuGULv/MZ74hKT2zzl/7wBckp0tKhOMjPxBHL9TCf709nhlXbNBggUWabHL9+4rQt7DL4Sd9jFpmiGgXYZ9WtK+USVPh3mbW8Pbdfn2ZLBV7iyc89ezu++RZQbQOXs702BUuNzp5gpcHPbaBy5ZO3uFlpMcauLR08g0vEz22gMuSTo7DFiz+8YJp2BU1cWnr5DteEj22icu2TiZ4OdVj17jc6uQAL11EWybPqs19wtOzHhxSIUuVV516xNs6ot1nrKja33HGKgEuEW3ISsrlvCLaOUFKvCDWDVu0WJrXZptbxJpQJ1BNV+Rkf8nj0Le4QDKbcU4d0Y4ItMYTktKjflqxDgnW4YQ73hgz5Z2EAR0UA8Q6IIrj+CuOEGufKA4Ra48oDhBrN/6KHaLYj79iL/YC2I34eLUzr1D4H/0CiQtTX7iK62YAAAAASUVORK5CYII=)}", "class"=>"sbox", "rect"=>{"x"=>187, "height"=>40, "y"=>192, "width"=>367, "left"=>8, "top"=>64, "center_y"=>192, "center_x"=>187}, "nodeType"=>"ELEMENT_NODE"}
(byebug) 
```

You can also act on the web view

```ruby
$ web_view.url
"https://www.google.fr/search?q=Spices"
$ web_view.go_back
"<VOID>"
$ web_view.go_forward
$ web_view.reload

```

#### Activity Indicator

```ruby
$ activity_indicator_view.animating?
true
```

#### Progress View

```ruby
$ progress_view.progress
0.5
```

#### Segmented Control

```ruby
$ segmented_control.selected_index
1
$ segmented_control.selected_index
"First"
```
