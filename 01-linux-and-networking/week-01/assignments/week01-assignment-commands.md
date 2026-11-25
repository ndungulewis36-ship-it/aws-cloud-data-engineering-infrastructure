  687  cd ~/aws-cloud-data-engineering-infrastructure/01-linux-and-networking/week-01/assignments
  688  git status
  689  git commit -m " edit bandit walkthrough"
  690  git push origin main
  691  cd ~/aws-cloud-data-engineering-infrastructure/01-linux-and-networking/week-01/assignments
  692  git add .
  693  git commit "bandit update"
  694  git commit -m"bandit update"
  695  git push
  696  cd ~/aws-cloud-data-engineering-infrastructure/01-linux-and-networking/week-01/assignments
  697  mkdir -p de-pipeline-project/{data/{raw,processed,staging},src/{ingestion,transformation,utils},logs,configs,tests}
  698  cd de-pipeline-project
  699  touch src/{ingestion/extract.py,transformation/clean.py,utils/helpers.py} tests/test_pipeline.py logs/pipeline.log
  700  cat << 'EOF' > data/raw/transactions_2026_11.csv
tx_id,user_id,amount,currency,status
1001,u_42,150.00,KES,completed
1002,u_19,85.50,KES,pending
1003,u_42,210.00,KES,failed
EOF

  701  cat << 'EOF' > configs/pipeline_config.yaml
pipeline_name: retail_etl
raw_path: data/raw/
processed_path: data/processed/
batch_size: 1000
EOF

  702  ls -laR
  703  grep "completed" data/raw/transactions_2026_11.csv > data/staging/completed_tx.csv
  704  cp data/staging/completed_tx.csv data/processed/final_tx.csv
  705  wc -l data/processed/final_tx.csv
  706  ls -laR
  707  grep "completed" data/raw/transactions_2026_11.csv > data/staging/completed_tx.csv
  708  cp data/staging/completed_tx.csv data/processed/final_tx.csv
  709  wc -l data/processed/final_tx.csv
  710  cd ..
  711  history 25 > week01-assignment-commands.md
