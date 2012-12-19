class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame UIScreen.mainScreen.bounds

    @controller = UIViewController.alloc.init
    @controller.view = UIView.alloc.initWithFrame @window.frame
    @controller.view.backgroundColor = UIColor.blueColor

    button = UIButton.buttonWithType UIButtonTypeRoundedRect
    button.setTitle "iOSDevSpot", forState: UIControlStateNormal
    button.frame = [[10, @window.center.y], [300, 50]]
    @controller.view.addSubview button

    button.when(UIControlEventTouchUpInside) do
      BW::HTTP.get("https://api.github.com/users/ricardovaleriano") do |response|
        p response.body.to_str
      end
    end

    @window.rootViewController = @controller
    @window.makeKeyAndVisible

    true
  end
end
