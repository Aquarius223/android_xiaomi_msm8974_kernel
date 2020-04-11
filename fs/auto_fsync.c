#include <linux/module.h>
#include <linux/kobject.h>
#include <linux/sysfs.h>
#include <linux/mutex.h>
#include <linux/notifier.h>
#include <linux/reboot.h>
#include <linux/syscalls.h>
#include <linux/fs.h>

static int dyn_fsync_panic_event(struct notifier_block *this,
		unsigned long event, void *ptr)
{
	sys_sync();
	emergency_sync();
	return NOTIFY_DONE;
}

static int dyn_fsync_notify_sys(struct notifier_block *this, unsigned long code,
				void *unused)
{
	if (code == SYS_HALT) 
	{
		sys_sync();
		emergency_sync();
	}
	if (code == SYS_DOWN) 
	{
		sys_sync();
	}
	return NOTIFY_DONE;
}

static struct notifier_block dyn_fsync_notifier = 
{
	.notifier_call = dyn_fsync_notify_sys,
};

static struct notifier_block dyn_fsync_panic_block = 
{
	.notifier_call  = dyn_fsync_panic_event,
	.priority       = INT_MAX,
};

static void dyn_fsync_init(void)
{
	register_reboot_notifier(&dyn_fsync_notifier);

	atomic_notifier_chain_register(&panic_notifier_list,
		&dyn_fsync_panic_block);
}

static void dyn_fsync_exit(void)
{
	unregister_reboot_notifier(&dyn_fsync_notifier);

	atomic_notifier_chain_unregister(&panic_notifier_list,
		&dyn_fsync_panic_block);
}

module_init(dyn_fsync_init);
module_exit(dyn_fsync_exit);

MODULE_AUTHOR("pop");
MODULE_DESCRIPTION("auto fsync");
MODULE_LICENSE("GPL v2");