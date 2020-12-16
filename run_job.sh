#!/bin/bash
module load pre2019
module load stopos
TMPDIR=`mktemp -d /scratch-local/tert.XXXX`
MYHOME=${HOME}/linux-cluster-computing/cluster/tertbutylchloride
cd $TMPDIR
STOPOS_RC="OK"
while [ "$STOPOS_RC" == "OK" ]; do
   stopos -p bondlengths next
   if [ "$STOPOS_RC" == "OK" ]; then
      cat ${MYHOME}/template | sed "s/LENGTH/$STOPOS_VALUE/g" > input_$STOPOS_VALUE
      ${HOME}/linux-cluster-computing/cluster/bin/gamess < input_$STOPOS_VALUE > ${MYHOME}/output_$STOPOS_VALUE
   fi
done
rm -rf ${TMPDIR}
