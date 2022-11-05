  function[varargout] = exloglog(varargin)
% function[varargout] = exloglog(varargin)
% Implements the matlab loglog function, but does some 
% modification of the plot so that it's readable upon
% export. This routine was written by Akil Narayan.
hand = loglog(varargin{:});
for q = 1:length(hand);
  set(hand,'LineWidth',5);
  set(hand,'MarkerSize',12);
end
set(gca, 'FontSize', 16, 'FontWeight', 'n');
if nargout>=1;
  varargout{1} = hand;
end
