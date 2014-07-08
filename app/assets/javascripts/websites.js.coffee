$ ->
  $('.website .description').each ->
    $clamp(this, {clamp: 3})
  $('.website h4 .title-tag').each ->
    $clamp(this, {clamp: 1})
  $('.website h4 a').each ->
    $clamp(this, {clamp: 1})
