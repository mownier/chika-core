Pod::Spec.new do |s|
  s.name     = 'ChikaCore'
  s.version  = '0.16'
  s.summary  = 'Core for Chika iOS App'
  s.platform = :ios, '11.0'
  s.license  = { :type => 'MIT', :file => 'LICENSE' }
  s.homepage = 'https://github.com/mownier/chika-core'
  s.author   = { 'Mounir Ybanez' => 'rinuom91@gmail.com' }
  s.source   = { :git => 'https://github.com/mownier/chika-core.git', :tag => s.version.to_s }
  s.requires_arc = true

  s.subspec 'Error' do |ss|
    ss.source_files = 'ChikaCore/Source/Error/*.swift'
  end

  s.subspec 'Result' do |ss|
    ss.source_files = 'ChikaCore/Source/Result/*.swift'
  end

  s.subspec 'Model' do |ss|
    ss.dependency 'ChikaCore/Model:Unique'
    ss.dependency 'ChikaCore/Model:Store'
    ss.dependency 'ChikaCore/Model:Auth'
  end
  
  s.subspec 'Model:Unique' do |ss|
    ss.source_files = 'ChikaCore/Source/Model/Unique/*.swift'
  end

  s.subspec 'Model:Auth' do |ss|
    ss.source_files = 'ChikaCore/Source/Model/Auth/*.swift'
    ss.dependency 'ChikaCore/Model:Unique'
  end

  s.subspec 'Model:Store' do |ss|
    ss.source_files = 'ChikaCore/Source/Model/Store/*.swift'
    ss.dependency 'ChikaCore/Model:Unique'
  end

  s.subspec 'Service' do |ss|
    ss.dependency 'ChikaCore/Service:Auth'
    ss.dependency 'ChikaCore/Service:Query'
    ss.dependency 'ChikaCore/Service:Search'
    ss.dependency 'ChikaCore/Service:Writer'
    ss.dependency 'ChikaCore/Service:Listener'
  end

  s.subspec 'Service:Auth' do |ss|
    ss.source_files = 'ChikaCore/Source/Service/Auth/*.swift'
    ss.dependency 'ChikaCore/Model:Auth'
    ss.dependency 'ChikaCore/Result'
  end

  s.subspec 'Service:Listener:Object' do |ss|
    ss.source_files = 'ChikaCore/Source/Service/Listener/Object/*.swift'
    ss.dependency 'ChikaCore/Model:Store'
  end

  s.subspec 'Service:Listener' do |ss|
    ss.source_files = 'ChikaCore/Source/Service/Listener/*.swift'
    ss.dependency 'ChikaCore/Service:Listener:Object'
    ss.dependency 'ChikaCore/Result'
  end

  s.subspec 'Service:Query' do |ss|
    ss.source_files = 'ChikaCore/Source/Service/Query/*.swift'
    ss.dependency 'ChikaCore/Model:Store'
    ss.dependency 'ChikaCore/Result'
  end

  s.subspec 'Service:Search' do |ss|
    ss.source_files = 'ChikaCore/Source/Service/Search/*.swift'
    ss.dependency 'ChikaCore/Model:Store'
    ss.dependency 'ChikaCore/Result'
  end

  s.subspec 'Service:Writer' do |ss|
    ss.source_files = 'ChikaCore/Source/Service/Writer/*.swift'
    ss.dependency 'ChikaCore/Model:Store'
    ss.dependency 'ChikaCore/Result'
  end

end

