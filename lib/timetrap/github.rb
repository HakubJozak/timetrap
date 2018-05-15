class Timetrap::Github

  def login
    octokit.user.login
  end

  def create_gist(display)
    gist = octokit.create_gist(
      description: 'Timetrap sheet',
      files: { 'overview.txt' => { content: display }}
    )
    gist[:html_url]
  end

#  private

  def octokit
    token = config['access_token']
    @octokit ||= Octokit::Client.new(access_token: token)
  end

  # TODO: change static access
  def config
    Timetrap::Config['github'] ||
      fail('Github settings missing in config file')
  end

  def user
    octokit.user.login
  end
  
end
