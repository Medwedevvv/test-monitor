# test-monitor задача

Написать скрипт на bash для мониторинга процесса test в среде linux. Скрипт должен отвечать следующим требованиям:  

* Запускаться при запуске системы (предпочтительно написать юнит systemd в дополнение к скрипту)
* Отрабатывать каждую минуту
* Если процесс запущен, то стучаться(по https) на https://test.com/monitoring/test/api
* Если процесс был перезапущен, писать в лог /var/log/monitoring.log (если процесс не запущен, то ничего не делать)
* Если сервер мониторинга не доступен, так же писать в лог.

# test-monitor решение

1. Bash-скрипт:  
  ```  
  /usr/local/bin/test-monitor.sh
  ```  
2. Права на выполнение:  
  ```  
  sudo chmod +x /usr/local/bin/test-monitor.sh
  ```
3. Systemd unit:  
  ```  
  /etc/systemd/system/test-monitor.service
  ```
4. Таймер, который запускается каждую минуту:  
  ```
  /etc/systemd/system/test-monitor.timer
  ```
5. Включение и запуск мониторинга:  
  ```
  sudo systemctl daemon-reload
  sudo systemctl enable --now test-monitor.timer
  ```
6.Проверка:  
  ```
  systemctl status test-monitor.timer
  journalctl -u test-monitor.service
  ```
![Mon](https://www.marketresearchintellect.com/images/blogs/market-insights-growth-drivers-in-network-performance-monitoring-software.webp)
