package com.hust.ecobikerental.ultils.rx;

import io.reactivex.Scheduler;


public interface SchedulerProvider {

    Scheduler computation();

    Scheduler io();

    Scheduler ui();
}
