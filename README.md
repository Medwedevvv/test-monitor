# test-monitor
Скрипт на bash для мониторинга процесса test в среде linux
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
