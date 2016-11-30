#!/bin/bash

HOST=localhost
PORT=5432
USER=osp_admin

HOSTNAME=`hostname`
TIMESTAMP=`date +%Y%m%d_%H%M%S`

BACKUP_DIR=$HOME/backups/osgp/${HOSTNAME}_$TIMESTAMP
mkdir -p $BACKUP_DIR/

echo "Creating backup of osgp databases in ${BACKUP_DIR} ..."

pg_dump -h $HOST -p $PORT -d osgp_adapter_protocol_dlms -U $USER -F t > $BACKUP_DIR/osgp_adapter_protocol_dlms.tar
pg_dump -h $HOST -p $PORT -d osgp_adapter_protocol_oslp -U $USER -F t > $BACKUP_DIR/osgp_adapter_protocol_oslp.tar
pg_dump -h $HOST -p $PORT -d osgp_adapter_ws_microgrids -U $USER -F t > $BACKUP_DIR/osgp_adapter_ws_microgrids.tar
pg_dump -h $HOST -p $PORT -d osgp_adapter_ws_smartmetering -U $USER -F t > $BACKUP_DIR/osgp_adapter_ws_smartmetering.tar
pg_dump -h $HOST -p $PORT -d osgp_core -U $USER -F t > $BACKUP_DIR/osgp_core.tar
pg_dump -h $HOST -p $PORT -d osgp_logging -U $USER -F t > $BACKUP_DIR/osgp_logging.tar
pg_dump -h $HOST -p $PORT -d osp_devicesimulator_web -U $USER -F t > $BACKUP_DIR/osp_devicesimulator_web.tar
pg_dump -h $HOST -p $PORT -d osp_net_management_web -U $USER -F t > $BACKUP_DIR/osp_net_management_web.tar
pg_dump -h $HOST -p $PORT -d osp_owner_web -U $USER -F t > $BACKUP_DIR/osp_owner_web.tar
pg_dump -h $HOST -p $PORT -d osp_user_management_web -U $USER -F t > $BACKUP_DIR/osp_user_management_web.tar

echo "Done."
