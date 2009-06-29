module Gembox  
  class Gems
    class << self
      attr_accessor :source_index
      
      def load
        @source_index ||= ::Gem.source_index
        local_gems
      end
      
      def local_gems
        @local_gems ||= group_gems(source_index.gems)
      end
      
      def search(search_term, version = nil, strict = false)
        version = version ? Gem::Requirement.create(version) : Gem::Requirement.default
        escaped = Regexp.escape(search_term)
        regexp = strict ? /^#{escaped}$/ : /#{escaped}/
        if strict
          gems = source_index.search Gem::Dependency.new(regexp, version)
        else
 
	  gems = source_index.select{|name, spec| 
            passed = true 
            combined_description = (spec.full_name.to_s + ' ' + ' ' + spec.summary.to_s).downcase
            for word in search_term.split(/\W/) # split into words
              passed &= combined_description.include?(word.downcase)
            end
            # doesn't work for some reason passed &= spec.version == version if version
            passed
          }.map{|name, spec| spec}
        end
        group_gems(gems)
      end
      
      def stats
        num_versions = source_index.length
        num_gems     = local_gems.length
        oldest_gem    = source_index.min {|a,b| a[1].date <=> b[1].date }.last
        youngest_gem   = source_index.max {|a,b| a[1].date <=> b[1].date }.last
{:num_versions => num_versions, :num_gems => num_gems, :oldest_gem => oldest_gem, :youngest_gem => youngest_gem}
      end
      
      protected
      def group_gems(gem_collection)
        gem_hash = GemList.new
        gem_collection = gem_collection.values if gem_collection.is_a?(Hash)
        gem_collection.each do |spec|
          gem_hash[spec.name] ||= []
          gem_hash[spec.name] << spec
          gem_hash[spec.name].sort! {|a,b| (b.version || 0) <=> (a.version || 0) }
        end
        gem_hash.sort {|a, b| a[0].downcase <=> b[0].downcase } 
      end
    end
    
  end
end
