#!/bin/bash
#srcipt reads 'new_r2r_ngdcid.txt' and processes / loads multibeam data using Ken Tanaka's jdb-load scripts.

#log='/nfs/mgg_apps/r2r/bin/data/pipeline_log.txt'
#input_file='/nfs/mgg_apps/r2r/bin/data/new_r2r_ngdcid.txt'
#echo " " >> $log
#echo "*********************************************************************"  >> $log
#echo "                            pipe6.sh                                 "  >> $log
#echo "*********************************************************************"  >> $log
#echo " " >> $log
#echo "pipe6: Starting DB population" | tee -a $log
input_file='/Users/georgianna.zelenak/Documents/ingest_pipes/new_r2r_ngdcid.txt'
echo "Input file is" $input_file
log='Users/georgianna.zelenak/Documents/ingest_pipes/pipeline_log.txt'
echo " "
echo "*********************************************************************"
echo "                            pipe6.sh                                 "
echo "*********************************************************************"
echo " "
echo "pipe6: Starting DB population" | tee

while read line; do
    echo "hello world"
    survey_info=$line
    echo "pipe6: Survey info: " $survey_info

    array=($(echo $survey_info | tr ", " "\n"))             # translate download file path into array separated by ", "
    #echo "pipe6: NGDC file system ship name: "${array[0]}   # array[0] is the NGDC file system ship name
    echo "array[0] (SHIP_NAME) = "${array[0]}
    #echo "pipe6: Cruise name: "${array[1]}                  # array[1] is cruise name
    echo "array[1] (CRUISE_NAME) = "${array[1]}
    #echo "pipe6: New NGDC ID: "${array[2]}                  # array[2] is the new NGDC ID
    echo "array[2] (NEW NGDC_ID) = "${array[2]}
    #echo -e "\npipe6: Working on "${array[0]} ${array[1]} >> $log
    echo "array[3] (platform) = "${array[3]}
    echo "pipe6: Working on "${array[0]} ${array[1]}
    #constants for all versions of data
    anc_format="4000"   #ancillary data, such as xbt, asvp, etc.
    meta_format="3000"  #metadata like xml, pdf, .txt, etc.
    prod_format="1000"  #.xyz, .kmz, .sd. .asc, etc.

# check for nonpublic directory
echo "IF VALUE"
echo 'Listing out files in /Users/georgianna.zelenak/Documents/ingest_pipes/'${array[3]}'/'${array[0]}'/'${array[1]}
echo $(ls '/Users/georgianna.zelenak/Documents/ingest_pipes/'${array[3]}'/'${array[0]}'/'${array[1]})
#echo $(ls '/mgg/MB/ocean/'${array[3]}'/'${array[0]}'/'${array[1]})

	if [ $(ls '/Users/georgianna.zelenak/Documents/ingest_pipes/'${array[3]}'/'${array[0]}'/'${array[1]}) == "nonpublic" ]; then
		#for version1 data
echo "You have a nonpublic directory"
		version1="1"
		version1_path='/mgg/MB/ocean/'${array[3]}'/'${array[0]}'/'${array[1]}'/nonpublic/multibeam/data/version1'
		anc1_path='/mgg/MB/ocean/'${array[3]}'/'${array[0]}'/'${array[1]}'/nonpublic/multibeam/data/version1/ancillary'
		echo "pipe6: V1 Ancillary path: "$anc1_path
		mb1_path='/mgg/MB/ocean/'${array[3]}'/'${array[0]}'/'${array[1]}'/nonpublic/multibeam/data/version1/MB'
		echo "pipe6: V1 MB path: "$mb1_path
		prod1_path='/mgg/MB/ocean/'${array[3]}'/'${array[0]}'/'${array[1]}'/nonpublic/multibeam/data/version1/products'
		echo "pipe6: V1 Products path: "$prod1_path
		meta1_path='/mgg/MB/ocean/'${array[3]}'/'${array[0]}'/'${array[1]}'/nonpublic/multibeam/data/version1/metadata'
		echo "pipe6: V1 Metadata path: "$meta1_path
  else
echo "nothing nonpublic here"
  fi

done < $input_file
exit 0

<<COMMENT1
	if [ $(ls '/mgg/MB/ocean/'${array[3]}'/'${array[0]}'/'${array[1]}) == "nonpublic" ]; then
		#for version1 data
echo "Entering if*********************"
		version1="1" 
		version1_path='/mgg/MB/ocean/'${array[3]}'/'${array[0]}'/'${array[1]}'/nonpublic/multibeam/data/version1'
		anc1_path='/mgg/MB/ocean/'${array[3]}'/'${array[0]}'/'${array[1]}'/nonpublic/multibeam/data/version1/ancillary'
		echo "pipe6: V1 Ancillary path: "$anc1_path
		mb1_path='/mgg/MB/ocean/'${array[3]}'/'${array[0]}'/'${array[1]}'/nonpublic/multibeam/data/version1/MB'
		echo "pipe6: V1 MB path: "$mb1_path
		prod1_path='/mgg/MB/ocean/'${array[3]}'/'${array[0]}'/'${array[1]}'/nonpublic/multibeam/data/version1/products'
		echo "pipe6: V1 Products path: "$prod1_path
		meta1_path='/mgg/MB/ocean/'${array[3]}'/'${array[0]}'/'${array[1]}'/nonpublic/multibeam/data/version1/metadata'
		echo "pipe6: V1 Metadata path: "$meta1_path
		#for version2 data
		version2="2"
		version2_path='/mgg/MB/ocean/'${array[3]}'/'${array[0]}'/'${array[1]}'/nonpublic/multibeam/data/version2'
		anc2_path='/mgg/MB/ocean/'${array[3]}'/'${array[0]}'/'${array[1]}'/nonpublic/multibeam/data/version2/ancillary'
		echo "pipe6: V2 Ancillary path: "$anc2_path
		mb2_path='/mgg/MB/ocean/'${array[3]}'/'${array[0]}'/'${array[1]}'/nonpublic/multibeam/data/version2/MB'
		echo "pipe6: V2 MB path: "$mb2_path
		prod2_path='/mgg/MB/ocean/'${array[3]}'/'${array[0]}'/'${array[1]}'/nonpublic/multibeam/data/version2/products'
		echo "pipe6: V2 Products path: "$prod2_path
		meta2_path='/mgg/MB/ocean/'${array[3]}'/'${array[0]}'/'${array[1]}'/nonpublic/multibeam/data/version2/metadata'
		echo "pipe6: V2 Metadata path: "$meta2_path
	else
		#for version1 data
echo "Entering else +++++++++++++++++++"
		version1="1" 
		version1_path='/mgg/MB/ocean/'${array[3]}'/'${array[0]}'/'${array[1]}'/multibeam/data/version1'
		anc1_path='/mgg/MB/ocean/'${array[3]}'/'${array[0]}'/'${array[1]}'/multibeam/data/version1/ancillary'
		echo "pipe6: V1 Ancillary path: "$anc1_path
		mb1_path='/mgg/MB/ocean/'${array[3]}'/'${array[0]}'/'${array[1]}'/multibeam/data/version1/MB'
		echo "pipe6: V1 MB path: "$mb1_path
		prod1_path='/mgg/MB/ocean/'${array[3]}'/'${array[0]}'/'${array[1]}'/multibeam/data/version1/products'
		echo "pipe6: V1 Products path: "$prod1_path
		meta1_path='/mgg/MB/ocean/'${array[3]}'/'${array[0]}'/'${array[1]}'/multibeam/data/version1/metadata'
		echo "pipe6: V1 Metadata path: "$meta1_path
		#for version2 data
		version2="2"
		version2_path='/mgg/MB/ocean/'${array[3]}'/'${array[0]}'/'${array[1]}'/multibeam/data/version2'
		anc2_path='/mgg/MB/ocean/'${array[3]}'/'${array[0]}'/'${array[1]}'/multibeam/data/version2/ancillary'
		echo "pipe6: V2 Ancillary path: "$anc2_path
		mb2_path='/mgg/MB/ocean/'${array[3]}'/'${array[0]}'/'${array[1]}'/multibeam/data/version2/MB'
		echo "pipe6: V2 MB path: "$mb2_path
		prod2_path='/mgg/MB/ocean/'${array[3]}'/'${array[0]}'/'${array[1]}'/multibeam/data/version2/products'
		echo "pipe6: V2 Products path: "$prod2_path
		meta2_path='/mgg/MB/ocean/'${array[3]}'/'${array[0]}'/'${array[1]}'/multibeam/data/version2/metadata'
		echo "pipe6: V2 Metadata path: "$meta2_path
	fi

    #check for and load multibeam version1 data
    if [ ! -d "$mb1_path" ]; then
        echo "pipe6: Directory "$mb1_path " does not exist!"  | tee -a $log
    else
	cd $version1_path #move to version1/ to make use of mbformat.txt file placed by previous scripts
	find MB/ -mindepth 1 -maxdepth 1 -type d ! -name "wcd" > mbdirs.txt
	numdirs=$(wc -l mbdirs.txt | awk '{ print $1 }')
	while read line; do
		mbdir=$version1_path/$line
		instr=$(echo ${line##*/})
		infor_file="mbformat."$instr
		if [ -f "$infor_file" ]; then
		    echo "pipe6: "$infor_file" exists!" | tee -a $log
		else
		    echo "pipe6: "$infor_file" does not exist!" | tee -a $log
		    cd $mbdir
		    find -type f ! -name "*999*" ! -name "*.prj" ! -name "*.fbt" ! -name "*.fnv" ! -name "*.inf" -name "*.mb*" -exec mbinfo -i > "$infor_file" {} \; -quit
		    if [ -e "$infor_file" ]; then
			echo "pipe6: "$infor_file" created" | tee -a $log
			mv $infor_file $version1_path
		    else
			echo "pipe6: FAILED to create "$infor_file | tee -a $log
		    fi
		    cd $version1_path
        	fi
		if [[ -s "$infor_file" ]]; then
			mbformat=$(find -type f -name "$infor_file" -exec awk 'FNR == 3 {print $5}' {} \; -quit)
        	else
			samplefile=$(find $mbdir -type f ! -name "*999*" ! -name "*.prj" ! -name "*.mb*" -print -quit)
			mbformat="${samplefile##*.}"
		fi
		#if format is an integer
		if  [[ $mbformat =~ ^-?[0-9]+$ ]]; then
        	    echo "pipe6: MB format is: "$mbformat | tee -a $log
		    cd $mbdir
        	    #create fnv, fbt, inf files
        	    echo "pipe6: Creating fast files" | tee -a $log
        	   #echo "pipe6: groovy /nfs/mgg_apps/MB/bin/groovy/remake_ftb.groovy " $mbformat $mbdir
		   #groovy /nfs/mgg_apps/MB/bin/groovy/remake_ftb.groovy $mbformat $mbdir
		   # find -type f ! -name "*.prj" -name "*.mb*" -exec mbdatalist -I{} -F "$mbformat" -N -O \;
		    find -type f ! -name "*.prj" ! -name "*.inf" ! -name "*.fbt" ! -name "*.fnv" -name "*.mb*" -exec mbdatalist -I{} -F "$mbformat" -O \;
        	    #load MB data files into NGDCID_AND_FILE DB table on Arcus
        	    echo "pipe6: Populating database tables with MB data" | tee -a $log
        	    echo "pipe6: /mgg/MB/processing/bin/jdbload-ocean_files.pl -d" ${array[2]} $mbformat $version1 $mbdir
        	    /mgg/MB/processing/bin/jdbload-ocean_files.pl -d ${array[2]} $mbformat $version1 $mbdir
		    #load cruise track geometry
		    echo "pipe6: Creating ship track" | tee -a $log
		    echo "pipe6: /mgg/MB/processing/bin/jdbload-ocean_track.pl -d -G" ${array[2]}
		    if [[ $numdirs -lt 2 ]]; then
			    /mgg/MB/processing/bin/jdbload-ocean_track.pl -d -G ${array[2]}
			    echo "pipe6: Ship track created, please examine in bathy viewer" | tee -a $log
		    fi
		else #integer format test failed
			echo "pipe6: Version 1 is a non-integer MB format: " $format  | tee -a $log
			echo "pipe6: /mgg/MB/processing/bin/jdbload-ocean_files.pl -d "${array[2]}" 900 "$version1 $mbdir
			/mgg/MB/processing/bin/jdbload-ocean_files.pl -d ${array[2]} 900 $version1 $mbdir 
        	    echo "pipe6: FAILED, non-integer MB format "$mbformat | tee -a $log
        	fi #close format test
		cd $version1_path
		numdirs=$((numdirs - 1))
	done < mbdirs.txt
	rm mbdirs.txt
	#track patch
#	find MB/ -type f -name "*.fbt" -exec mblist -I{} -K10 -OUYX \; >> out.txt
#	cat out.txt | sort >> sort_out.txt
#	groovy /nfs/mgg_apps/MB/bin/groovy/remove_time_stamp.groovy $version1_path/sort_out.txt
#	groovy /nfs/mgg_apps/MB/bin/groovy/load_WKT.groovy $version1_path/sort_out.txt.out ${array[2]}
#	if [ $? == "1" ]; then
#		echo "pipe6: FAILED, track patch error, check track in viewer" | tee -a $log
#	else
#		echo "pipe6: Track patch done, check track in viewer" | tee -a $log
#		rm out.txt sort_out.txt sort_out.txt.out
#	fi
     fi #close mb1 dir existence check    
    
    #check for and load ancillary data
    if [ ! -d "$anc1_path" ]; then
        echo "pipe6: Directory "$anc1_path "does not exist!" | tee -a $log
    else
        echo "pipe6: Populating database tables with ancillary data" | tee -a $log
        echo "pipe6: /mgg/MB/processing/bin/jdbload-ocean_files.pl -d " ${array[2]} $anc_format $version1 $anc1_path
         /mgg/MB/processing/bin/jdbload-ocean_files.pl -d ${array[2]} $anc_format $version1 $anc1_path
    fi

    #check for and load products
    if [ ! -d "$prod1_path" ]; then
        echo "pipe6: Directory "$prod1_path "does not exist!" | tee -a $log
    else
        echo "pipe6: Populating database tables with products" | tee -a $log
        echo "pipe6: /mgg/MB/processing/bin/jdbload-ocean_files.pl -d " ${array[2]} $prod_format $version1 $prod1_path
        /mgg/MB/processing/bin/jdbload-ocean_files.pl -d ${array[2]} $prod_format $version1 $prod1_path
    fi
    
    #check for and load metadata
    if [ ! -d "$meta1_path" ]; then
    	echo "pipe6: Directory "$meta1_path "does not exist!" | tee -a $log
    else
    	echo "pipe6: Populating database tables with metadata" | tee -a $log
    	echo "pipe6: /mgg/MB/processing/bin/jdbload-ocean_files.pl -d " ${array[2]} $meta_format $version1 $meta1_path
    	/mgg/MB/processing/bin/jdbload-ocean_files.pl -d ${array[2]} $meta_format $version1 $meta1_path
    fi

    #check for and load version2 data
    if [ ! -d "$version2_path" ]; then
        echo "pipe6: Directory "$version2_path "does not exist!" | tee -a $log
    else
        #check for and load multibeam version2 data
        if [ ! -d "$mb2_path" ]; then
        	echo "pipe6: Directory "$mb2_path " does not exist!" | tee -a $log
        else
	        cd $version2_path #move to version2 MB dir
	        find MB/ -mindepth 1 -type d ! -name "wcd" > mbdirs.txt
	        while read line; do
			mb2dir=$version2_path/$line
			instr=$(echo ${line##*/})
			infor_file="mbformat."$instr
			if [ -f "$infor_file" ]; then
			    echo "pipe6: "$infor_file" exists!" | tee -a $log
			else
			    echo "pipe6: "$infor_file" does not exist!" | tee -a $log
			fi
			    cd $mb2dir
			    find -type f ! -name "*999*" ! -name "*.prj" -name "*.mb*" -exec mbinfo -i > "$infor_file" {} \; -quit
		        if [ -e "$infor_file" ]; then
				echo "pipe6: "$infor_file" created" | tee -a $log
				mv $infor_file $version2_path
    			else
				echo "pipe6: FAILED to create "$infor_file | tee -a $log
		        fi
			    cd $version2_path
		 if [[ -s "$infor_file" ]]; then
                 	mbformat=$(find -type f -name "$infor_file" -exec awk 'FNR == 3 {print $5}' {} \; -quit)
               	 else
                        samplefile=$(find $mb2dir -type f ! -name "*999*" ! -name "*.prj" ! -name "*.mb*" -print -quit)
                        mbformat="${samplefile##*.}"
		fi
	       	#if format is an integer
			if  [[ $mbformat =~ ^-?[0-9]+$ ]]; then
	        	    echo "pipe6: MB format is: "$mbformat | tee -a $log
			    cd $mb2dir
	        	    #create fnv, fbt, inf files
	        	    echo "pipe6: Creating fast files" | tee -a $log
			    echo "pipe6: groovy /nfs/mgg_apps/MB/bin/groovy/remake_ftb.groovy " $mbformat $mbdir
 			 	   # groovy /nfs/mgg_apps/MB/bin/groovy/remake_ftb.groovy $mbformat $mbdir
		       #find -type f ! -name "*.prj" -name "*.mb*" -exec mbdatalist -I{} -F "$mbformat" -N -O \;
			find -type f ! -name "*.prj" ! -name "*.inf" ! -name "*.fbt" ! -name "*.fnv" -name "*.mb*" -exec mbdatalist -I{} -F "$mbformat" -O \;
			# hard coded for OE v2 MB data, which must be put in format *.txt.mb162 prior to this script...
			#mbformat="121"
			#load MB data files into NGDCID_AND_FILE DB table on Arcus
				echo "pipe6: Populating database tables with version 2 MB data" | tee -a $log
				echo "pipe6: /mgg/MB/processing/bin/jdbload-ocean_files.pl -d" ${array[2]} $mbformat $version2 $mb2dir
				/mgg/MB/processing/bin/jdbload-ocean_files.pl -d ${array[2]} $mbformat $version2 $mb2dir
				#add version2 mb files to mbinfo_file_tsql
				echo "pipe6: Updating ship track" | tee -a $log
				echo "pipe6: /mgg/MB/processing/bin/jdbload-ocean_track.pl -d -G -notrunc" ${array[2]}
				/mgg/MB/processing/bin/jdbload-ocean_track.pl -d -G -notrunc ${array[2]}
				echo "pipe6: /mgg/MB/processing/bin/jdbload-ocean_track_no_survey.pl -d -G -notrunc" ${array[2]}
				/mgg/MB/processing/bin/jdbload-ocean_track_no_survey.pl -d -G -notrunc ${array[2]}
	                else #format test failed
	                    echo "pipe6: FAILED, non-integer MB format "$mbformat | tee -a $log
			    echo "pipe6: Trying unsupported format load "$mbformat | tee -a $log
			    echo "pipe6: /mgg/MB/processing/bin/jdbload-ocean_files.pl -d" ${array[2]} " 900 " $version2 $mb2dir
			    /mgg/MB/processing/bin/jdbload-ocean_files.pl -d ${array[2]} 900 $version2 $mb2dir
	                fi #close format test
	                cd $version2_path
		done < mbdirs.txt
		rm mbdirs.txt
	fi #close mb2 dir existence check    
    
        #check for and load ancillary data
        if [ ! -d "$anc2_path" ]; then
            echo "pipe6: Directory "$anc2_path "does not exist!" | tee -a $log
        else
            echo "pipe6: Populating database tables with version 2 ancillary data" | tee -a $log
            echo "pipe6: /mgg/MB/processing/bin/jdbload-ocean_files.pl -d " ${array[2]} $anc_format $version2 $anc2_path
            /mgg/MB/processing/bin/jdbload-ocean_files.pl -d ${array[2]} $anc_format $version2 $anc2_path
        fi
       
        #check for and load products
	if [ ! -d "$prod2_path" ]; then
	    echo "pipe6: Directory "$prod2_path "does not exist!" | tee -a $log
        else
	    echo "pipe6: Populating database tables with version 2 products" | tee -a $log
	    echo "pipe6: /mgg/MB/processing/bin/jdbload-ocean_files.pl -d " ${array[2]} $prod_format $version2 $prod2_path
	    /mgg/MB/processing/bin/jdbload-ocean_files.pl -d ${array[2]} $prod_format $version2 $prod2_path
        fi
    
        #check for and load metadata
        if [ ! -d "$meta2_path" ]; then
	    echo "pipe6: Directory "$meta2_path "does not exist!" | tee -a $log
        else
	    echo "pipe6: Populating database tables with version 2 metadata" | tee -a $log
	    echo "pipe6: /mgg/MB/processing/bin/jdbload-ocean_files.pl -d " ${array[2]} $meta_format $version2 $meta2_path
	    /mgg/MB/processing/bin/jdbload-ocean_files.pl -d ${array[2]} $meta_format $version2 $meta2_path
        fi

    fi #close version2 directory existence check

done < $input_file

echo "pipe6: Done; check MB.NGDCID_AND_FILE, MB.MBINFO_FILE_TSQL, and track" | tee -a $log
exit 0
COMMENT1