require 'spec_helper'

describe Task do
  context 'basic' do
    let(:task) { Task.new(id_user: 1, id_plan: 1, task: '1') }
    let(:wrongTask) { Task.new(id_user: 1, id_plan: 1) }
    let(:wrongTask2) { Task.new(id_user: '1', id_plan: 'a', task: '1') }
    it { task.save.should be_true }
    it { wrongTask.save.should_not be_true }
    it { wrongTask2.save.should_not be_true }
    
    it { expect{ task.save() }.to change{ Task.count }.by(1) }
    it { expect{ wrongTask.save() }.not_to change{ Task.count }.by(1) }
    it { expect{ wrongTask2.save() }.not_to change{ Task.count }.by(1) }

  end
  context 'update functionality' do
    let(:task) { Task.create(id_user: 1, id_plan: 1, task: '1') }
    let(:rightTime) { { value: Time.now, name: :finish_time } }
    let(:rightTime2) { { value: '2013-07-01', name: :finish_time, type: :str } }
    let(:wrongTime1) { { value: '2013-32-12', name: :finish_time, type: :str } }
    let(:wrongTime2) { { value: 'sd-dfd-', name: :finish_time, type: :str } }

    it 'right save 1' do
      task.set_time(rightTime) 
      Task.find(task.id).finish_time.should eq rightTime[:value].to_date
    end
    it 'string time right save' do
      task.set_time(rightTime2) 
      Task.find(task.id).finish_time.to_s.should eq rightTime2[:value]
    end
    it 'wrong time set' do
      task.set_time(wrongTime1).should be_false
      Task.find(task.id).finish_time.to_s.should_not eq wrongTime1[:value]
    end
    it { task.set_time(wrongTime2).should be_false }
  end
  

end