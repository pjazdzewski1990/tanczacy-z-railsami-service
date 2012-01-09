Unicron.schedule delay: 60, repeat: true do
  CollectorManager.instance.collect [ :facebook ]
end

Unicron.schedule delay: 60, repeat: true do
  CollectorManager.instance.collect [ :googleplus ]
end
