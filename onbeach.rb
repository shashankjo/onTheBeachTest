#==========================================
# Title:  On the Beach coding exercise
# Author: Kumar Shashank
# Date:   22 May 2019
#==========================================

class Onbeach

  def self.get_sequence(input_hash)
    final_job_sequence = [""]    # initialize the array that will store the job sequence
    iteration=1    # variable taken for your debugging purpose. Remove it in production code
    until input_hash.empty? do
      input_hash.each { |key,value| return "A job cannot be dependent on itself" if key == value }
      job = input_hash.select {|key, value| final_job_sequence.include? value}.keys    # select keys whose hash-value exists in the final_job_sequence array.
      raise Exception.new("Circular dependency exist in the given dependency hash") if job.empty?
      final_job_sequence += job
      puts "Job Sequence formed in iteration #{iteration} ---> "+ final_job_sequence.to_s   # shows formation of job sequence at each iteration
      iteration+=1
      input_hash.delete_if {|key,value| final_job_sequence.include? key}  # delete the key-value pair from input_hash if that key exists in the final_job_sequence array
    end
    return final_job_sequence.delete_if {|n| n.empty?}.join("")   # remove empty elements from the array and concatenate(join) each element to form a String
  end
end

dependencies=Hash.new
dependencies["a"] = ""
dependencies["b"] = "c"
dependencies["c"] = "f"
dependencies["d"] = "a"
dependencies["e"] = "b"
dependencies["f"] = ""

answer=Onbeach.get_sequence(dependencies)
puts "Final job sequence = "+ answer




