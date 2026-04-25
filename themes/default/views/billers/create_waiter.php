<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<div class="box">
    <div class="box-header">
        <h2 class="blue"><i class="fa-fw fa fa-users"></i><?= lang('create_waiter'); ?></h2>
    </div>
    <div class="box-content">
        <div class="row">
            <div class="col-lg-12">
                <p class="introtext"><?php echo lang('create_waiter'); ?></p>

                <!-- <form method="POST" action="<?php //echo base_url() ?>billers/create_waiter"> -->
                <!-- <input type="hidden" name="token" value="745e5402b315f26cc42f82cf99eb5e46" style="display:none;" /> -->
                <?php $attrib = array( 'role' => 'form');
                echo form_open("billers/create_waiter", $attrib);
                ?>
                <div class="row">
                    <div class="col-md-12">
                        <div class="col-md-5">
                            <div class="form-group">
                                Salesman Name
                                <div class="controls">
                                    <input type="text" name="waiter_name" class="form-control" value="" required>
                                </div>
                            </div>

                            <div class="form-group">
                                Salesman Description
                                <div class="controls">
                                    <textarea name="waiter_desc"></textarea>
                                </div>
                            </div>
                            <p><input name="submit" value="Create waiter" class="btn btn-primary" type="submit"></p>
                        </div>
                    </div>
                </div>

                <?php echo form_close(); ?>
            </div>
        </div>
    </div>
</div>