
$('.password-reset-button').on('click', function() {
  $('.password-reset').html(`
    <div class="form-group">
      <label for="user_password">Password</label>
      <input class="form-control" type="password" name="user[password]" id="user_password" />
    </div>

    <div class="form-group">
      <label for="user_password_confirmation">Password confirmation</label>
      <input class="form-control" type="password" name="user[password_confirmation]" id="user_password_confirmation" />
    </div>
  `)
});
